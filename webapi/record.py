from flask import Blueprint, jsonify, request
from module.DBManager import DBManager

record = Blueprint('record', __name__, url_prefix='/api/v1')
db = DBManager()


# select * from record
@record.route('/record', methods=['GET'])
def getRecord():
    sql = "SELECT * FROM {table}".format(table=db.record_table)
    db.cur.execute(sql)
    db.conn.commit()
    db_result = db.cur.fetchall()
    return jsonify(db_result)


# insert into record...
@record.route("/record", methods=['PUT'])
def putRecord():
    date_str = request.json["date"]
    menu_id = request.json["menu_id"]
    count = request.json["count"]

    sql = "INSERT INTO {table}(date, menu_id, count) VALUE(%(date)s, %(menu_id)s, %(count)s)".format(
        table=db.record_table)
    db.cur.execute(sql, {"date": date_str, "menu_id": menu_id, "count": count})
    db.conn.commit()
    db_result = db.cur.fetchall()
    return jsonify(db_result)
