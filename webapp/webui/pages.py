from flask import Blueprint, render_template
import logging
from module.DBManager import DBManager

pages = Blueprint('pages', __name__, url_prefix='/')
db = DBManager()
logging.basicConfig(level=logging.DEBUG)


# top page
@pages.route("/", methods=['GET'])
def index():
    title = "TrainingLog"
    return render_template('index.html', title=title)
