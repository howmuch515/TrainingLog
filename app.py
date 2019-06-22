from flask import Flask, jsonify
from webapi.record import record

app = Flask(__name__)
# /api/v1/*
app.register_blueprint(record)
