from filetracker import db
from flask_sqlalchemy import SQLAlchemy
from flask import current_app


class ViewGetSalesSum(db.Model):
    __tablename__ = 'vw_c_sales_data_sum'
    RowN = db.Column(db.Integer, primary_key=True)
    REGION = db.Column(db.String(100))
    REVENUE = db.Column(db.Float)
    COST = db.Column(db.Float)
    PROFIT = db.Column(db.Float)

class ViewGetSalesProd(db.Model):
    __tablename__ = 'vw_c_sales_data_prod_type'
    RowN = db.Column(db.Integer, primary_key=True)
    PRODUCT = db.Column(db.String(100))
    REVENUE = db.Column(db.Float)
    COST = db.Column(db.Float)
    PROFIT = db.Column(db.Float)