from flask import Flask, jsonify
from webapi.record import record
from webapi.menu import menu
from webui.pages import pages

app = Flask(__name__)
# /api/v1/record
app.register_blueprint(record)

# /api/v1/menu
app.register_blueprint(menu)

# /*
app.register_blueprint(pages)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
