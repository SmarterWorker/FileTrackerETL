import os
import json

# Should really add config to a json file with limited access

# With open("location:config.json") as config_file:
# config = json.load(config_file)

class  Config(object):
# SECRET_KEY = config.get('SECRET_KEY')
# SQLALCHEMY_DATABASE_URI = config.get('SQLALCHEMY_DATABASE_URI')
# Move values to env variables:
# To Use DSN mssql+pyodbc://user:pass@dsn

    DEBUG = False
    TESTING = True

class ProductionConfig(Config):
    pass

class DevelopmentConfig(Config):
    # Main configuration
    SECRET_KEY = '802ca79621757266c35c4417303440ab'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_DATABASE_URI = 'mssql+pyodbc://username:password@sqlserver:1433/file_tracker?driver=SQL+Server+Native+Client+11.0'
    # SQLALCHEMY_DATABASE_URI = 'mssql+pyodbc://user:pass@sqlserver:1433/file_manager?driver=SQL+Server+Native+Client+11.0'
    # SQLALCHEMY_DATABASE_URI = 'mssql+pyodbc://EUDEVSQL05/ReGReporting_DB_01?driver=ODBC+Driver+17+for+SQL+Server&authentication=ActiveDirectoryIntegrated&Encrypt=No'
    # SQLALCHEMY_DATABASE_URI = 'mssql+pyodbc://EUDEVSQL05/ReGReporting_DB_01?driver=ODBC+Driver+17+for+SQL+Server&authentication=ActiveDirectoryIntegrated&Encrypt=No'
    # SQLALCHEMY_DATABASE_URI = 'mssql+pyodbc://REG_RPT_DEV/?authentication=ActiveDirectoryIntegrated'
    DEBUG = True

    # Image settings for upload
    IMAGE_UPLOADS = (os.path.dirname(os.path.abspath(__file__)) + "\static\images\\")
    VERSION = "V2.5"
    ALLOWED_IMAGE_EXT = ["PNG","JPG", "JPEG", "GIF"]
    MAX_IMAGE_FILESIZE = 5

    # The absolute path of the directory containing images for users to download
    CLIENT_IMAGES = "F:/downloads/images"
    
    # The absolute path of the directory containing CSV files for users to download
    CLIENT_CSV = "F:\downloads\csv"

    # The absolute path of the directory containing PDF files for users to download
    CLIENT_PDF = "F:\downloads\pdf"

    SQL_SERVER_CON = 'Driver={SQL Server};Server=dellserver;Database=file_tracker;UID=tesh;PWD=tesh'


class TestingConfig(Config):
    pass
