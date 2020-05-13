import configparser
import logging
import MySQLdb
from time import sleep

DB_CONFIG_FILE = "./settings/dbinfo.ini"
SLEEP_INTERVAL = 3
CONNECTION_TRY_LIMIT = 10
logging.basicConfig(level=logging.DEBUG)


class DBManager():
    def __init__(self):
        config = self.loadConfig(DB_CONFIG_FILE)
        self.host = config["HOST"]
        self.port = config["PORT"]
        self.user = config["USER"]
        self.passwd = config["PASSWD"]
        self.db_name = config["DB_NAME"]
        self.record_table = config["RECORD_TABLE"]
        self.menu_table = config["MENU_TABLE"]
        self.category_table = config["CATEGORY_TABLE"]
        self.conn = None
        self.cur = None

    def loadConfig(self, db_config_file):
        try:
            parser = configparser.ConfigParser()
            parser.read(db_config_file)
            return parser['mysql']

        except Exception as e:
            logging.critical("Load DB Config error")
            logging.critical(e)

    def connectDB(self):
        access_counter = 0

        while access_counter < CONNECTION_TRY_LIMIT:
            try:
                access_counter += 1
                self.conn = MySQLdb.connect(
                    host=self.host,
                    port=int(self.port),
                    user=self.user,
                    passwd=self.passwd,
                    db=self.db_name,
                )
                self.cur = self.conn.cursor(MySQLdb.cursors.DictCursor)
                logging.info(f"[*] DB Connection is success!")
                return self.conn, self.cur

            except MySQLdb.Error as e:
                logging.critical(f"[!] ({access_counter})Connect DB error.")
                logging.critical(e)
                sleep(SLEEP_INTERVAL)

    def closeDB(self):
        self.cur.close()
        self.conn.close()
    