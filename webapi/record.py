from flask import Blueprint, jsonify
from module.DBManager import DBManager

record = Blueprint('record', __name__, url_prefix='/api/v1')
db = DBManager()


@record.route('/record', methods=['GET'])
def getRecodrd():
    sql = "SELECT * FROM {table}".format(table=db.record_table)
    db.cur.execute(sql)
    db.conn.commit()
    db_result = db.cur.fetchall()
    return jsonify(db_result)
