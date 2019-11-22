from flask import Blueprint, render_template
from flask_httpauth import HTTPDigestAuth, HTTPBasicAuth
import logging
import configparser
from module.DBManager import DBManager

AUTH_FILE = "./settings/auth.ini"
pages = Blueprint('pages', __name__, url_prefix='/')
db = DBManager()
auth = HTTPBasicAuth()
auth_config = ""
try:
    parser = configparser.ConfigParser()
    parser.read(AUTH_FILE)
    auth_config = parser['basic_auth']

except Exception as e:
    logging.critical("Load DB Config error")
    logging.critical(e)

username = auth_config['USERNAME']
passwd = auth_config['PASSWD']

logging.basicConfig(level=logging.DEBUG)

@auth.get_password
def get_pw(uname):
    if uname==username:
        return passwd
    return None

# top page
@pages.route("/", methods=['GET'])
@auth.login_required
def index():
    title = "TrainingLog"
    return render_template('index.html', title=title)
