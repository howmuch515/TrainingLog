from flask import Blueprint, render_template
# from flask_httpauth import HTTPDigestAuth, HTTPBasicAuth
import logging
import configparser
from module.DBManager import DBManager

pages = Blueprint('pages', __name__, url_prefix='/')
db = DBManager()

logging.basicConfig(level=logging.DEBUG)

def get_pw(uname):
    if uname==username:
        return passwd
    return None

# top page
@pages.route("/", methods=['GET'])
def index():
    title = "TrainingLog"
    return render_template('index.html', title=title)
