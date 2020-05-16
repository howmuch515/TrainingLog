from functools import wraps
from flask import Blueprint, jsonify, request
import logging
from module.DBManager import DBManager

record = Blueprint('record', __name__, url_prefix='/api/v1')
logging.basicConfig(level=logging.DEBUG)


# DB connect decorator.
def dbConnect(func):
    @wraps(func)
    def decorate(*args, **keywords):
        keywords["db"] = DBManager()
        keywords["db"].connectDB()
        result = func(*args, **keywords)
        keywords["db"].closeDB()
        return result

    decorate.__name__ = func.__name__
    return decorate

# insert into record...
@record.route("/record", methods=['PUT'])
@dbConnect
def putRecord(db):
    logging.debug(request.json)

    date_str = request.json["date"]
    menu_id = request.json["menu_id"]
    count = request.json["count"]

    sql = "INSERT INTO {table}(date, menu_id, count) VALUE(%(date)s, %(menu_id)s, %(count)s)".format(
        table=db.record_table)
    db.cur.execute(sql, {"date": date_str, "menu_id": menu_id, "count": count})
    db.conn.commit()
    db_result = db.cur.fetchall()
    return jsonify(db_result)


# select * from record
@record.route('/record', methods=['GET'])
@dbConnect
def getRecord(db):
    sql = """
            SELECT R.id AS record_id, DATE_FORMAT(R.date,'%Y-%m-%d') AS date, R.count AS count, M.id AS menu_id, M.name AS menu_name, M.step AS menu_step, C.id AS category_id, C.name AS category_name
            FROM {record_table} R
            JOIN {menu_table} M ON R.menu_id=M.id
            JOIN {category_table} C ON M.category_id=C.id
            ORDER BY R.date
        """.format(record_table=db.record_table, menu_table=db.menu_table, category_table=db.category_table)

    db.cur.execute(sql)
    db.conn.commit()
    db_result = db.cur.fetchall()

    # json format
    a = lambda x: {
        "record_id": x["record_id"],
        "date": x["date"],
        "count": x["count"],
        "menu": {
            "menu_id": x["menu_id"],
            "menu_name": x["menu_name"],
            "menu_step": x["menu_step"],
            "category": {
                "category_id": x["category_id"],
                "category_name": x["category_name"]
            }
        }
    }

    return jsonify(list(map(a, db_result)))


# update record set ?=?? where id=???
@record.route("/record", methods=['PATCH'])
@dbConnect
def patchRecord(db):
    try:
        req_query = request.json
        record_id = req_query.pop("record_id")

        for k, v in req_query.items():
            if k == "date":
                sql = "UPDATE {table} SET date=%s WHERE id=%s".format(table=db.record_table)
            elif k == "menu_id":
                sql = "UPDATE {table} SET menu_id=%s WHERE id=%s".format(table=db.record_table)
            elif k == "count":
                sql = "UPDATE {table} SET count=%s WHERE id=%s".format(table=db.record_table)
            else:
                raise Exception("{}: update key is invalid".fromat(k))

            db.cur.execute(sql, (v, record_id,))
            db.conn.commit()
    except Exception as e:
        logging.debug(e)
        return jsonify({"error": e}), 500

    return jsonify({"success": req_query}), 200


# delete from record where id=?
@record.route("/record", methods=['DELETE'])
@dbConnect
def deleteRecord(db):
    try:
        req_query = request.json
        record_id = req_query.pop("record_id")
        sql = "DELETE FROM {table} WHERE id=%(id)s".format(table=db.record_table)

        db.cur.execute(sql, {"id": record_id})
        db.conn.commit()
        db_result = db.cur.fetchall()
    except Exception as e:
        logging.debug(e)
        return jsonify({"error": e}), 500

    return jsonify(db_result), 200
