from flask import Blueprint, jsonify
from module.DBManager import DBManager

record = Blueprint('record', __name__, url_prefix='/api/v1')
db = DBManager()

@record.route('/record')
def getRecodrd():
    return jsonify({"msg": "Hello, world!"})
