from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_login import LoginManager
import os

app = Flask(__name__)
app.secret_key = '^%*&!^@^*gsuias1&^&!*^!&'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:123456789@localhost/bookapp4?charset=utf8'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

db = SQLAlchemy(app=app)
admin = Admin(app=app,name="YU BOOK", template_mode="bootstrap4")
login = LoginManager(app=app)
