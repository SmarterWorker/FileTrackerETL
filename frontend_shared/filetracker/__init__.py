from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from filetracker.config import DevelopmentConfig, ProductionConfig, TestingConfig
import flask_excel as excel

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    #reads FLASK_ENV variable
    print("ENV: " + app.config['ENV'])

    # Values set in the config.py file .
    if app.config["ENV"] == "production" :
        app.config.from_object(ProductionConfig)

    elif app.config["ENV"] == "testing" :
        app.config.from_object(TestingConfig)
        
    else :
        app.config.from_object(DevelopmentConfig)
    with app.app_context():
        from filetracker.filestatus.filestatus import filestatus
        from filetracker.custom.custom import custom
        from filetracker.errors.handlers import errors

        app.register_blueprint(filestatus, url_prefix="/")
        app.register_blueprint(custom, url_prefix="/")
        app.register_blueprint(errors, url_prefix="/")

    db.init_app(app)
    excel.init_excel(app)

    return app