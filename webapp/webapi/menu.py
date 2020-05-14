from functools import wraps
from flask import Blueprint, abort, jsonify, request
import logging
from module.DBManager import DBManager

menu = Blueprint('menu', __name__, url_prefix='/api/v1')
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

@menu.route("/menu", methods=['GET'])
@dbConnect
def getAllMenu(db):
    sql = "SELECT category.id category_id, category.name category_name FROM {table}".format(table=db.category_table)
    db.cur.execute(sql)
    db.conn.commit()
    db_result = db.cur.fetchall()
    result_list = []
    for i in db_result:
        result_list.append({
            "category_id": i["category_id"],
            "category_name": i["category_name"],
            "menu": []
        })

    # list up category
    sql = """
        SELECT menu.id menu_id, menu.name menu_name, menu.step menu_step, category_id, category.name category_name
        FROM {menu_table}
        JOIN {category_table} ON menu.category_id=category.id
    """.format(menu_table=db.menu_table, category_table=db.category_table)

    db.cur.execute(sql)
    db.conn.commit()
    db_result = db.cur.fetchall()

    # group by category
    for i in db_result:
        for j in result_list:
            if i["category_id"] == j["category_id"]:
                j["menu"].append({
                    "menu_id": i["menu_id"],
                    "menu_name": i["menu_name"],
                    "menu_step": i["menu_step"]
                })

    return jsonify(result_list)

@menu.route("/menu/<string:category_name>", methods=['GET'])
@dbConnect
def getMenu(db, category_name):
    # check user input category_name
    category_sql = """
        SELECT category.name category_name
        FROM {category_table}
    """.format(category_table=db.category_table)

    db.cur.execute(category_sql)
    db.conn.commit()
    category_result = db.cur.fetchall()

    category_list = list(map(lambda x: x["category_name"], category_result))
    if category_name not in category_list:
        return  jsonify({"message": "category name is invalid."}), 404

    # list up category
    sql = """
        SELECT menu.id menu_id, menu.name menu_name, menu.step menu_step, category_id, category.name category_name
        FROM {menu_table}
        JOIN {category_table} ON menu.category_id=category.id
        WHERE category.name=%s
    """.format(menu_table=db.menu_table, category_table=db.category_table)

    db.cur.execute(sql, (category_name,))
    db.conn.commit()
    db_result = db.cur.fetchall()

    # group by category
    result_list = []
    for i in db_result:
        result_list.append({
            "menu_id": i["menu_id"],
            "menu_name": i["menu_name"],
            "menu_step": i["menu_step"]
        })

    return jsonify(result_list)
