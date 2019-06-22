from flask import Flask, jsonify
from webapi.record import record

app = Flask(__name__)
app.register_blueprint(record)
