import configparser
import logging
import MySQLdb

DB_CONFIG_FILE = "./settings/dbinfo.ini"
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

        # connect DB
        self.conn = self.connectDB()
        self.cur = self.conn.cursor(MySQLdb.cursors.DictCursor)

    def __del__(self):
        self.cur.close()
        self.conn.close()

    def loadConfig(self, db_config_file):
        try:
            parser = configparser.ConfigParser()
            parser.read(db_config_file)
            return parser['mysql']

        except Exception as e:
            logging.critical("Load DB Config error")
            logging.critical(e)

    def connectDB(self):
        try:
            conn = MySQLdb.connect(
                host=self.host,
                port=int(self.port),
                user=self.user,
                passwd=self.passwd,
                db=self.db_name,
            )
            return conn
        except Exception as e:
            logging.critical("Connect DB error")
            logging.critical(e)

    def deleteRecord(self, id):
        sql = "DELETE FROM {table} WHERE id=%(id)s".format(table=self.record_table)
        cur = self.conn.cursor(MySQLdb.cursors.DictCursor)
        cur.execute(sql, {"table": self.record_table, "id": id})
        self.conn.commit()
        cur.close()
