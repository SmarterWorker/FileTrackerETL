from flask import Blueprint, render_template,  request, current_app
import os
from datetime import datetime, timedelta
from filetracker.custom.models import ViewGetSalesSum, ViewGetSalesProd
import flask_excel as excel


# Using and_ IMPLICITLY:
custom = Blueprint('custom', __name__, template_folder='templates', static_folder='static' )

#Rejects for FCA
@custom.route("/salesdatasum")
def salesdatasum():
    data = ViewGetSalesSum.query.order_by(ViewGetSalesSum.PROFIT)
    data2 = ViewGetSalesProd.query.order_by(ViewGetSalesProd.PROFIT)
    #print(data2)
    
    lblREG = ViewGetSalesSum.query.with_entities(ViewGetSalesSum.REGION)
    lblPROD = ViewGetSalesSum.query.with_entities(ViewGetSalesProd.PRODUCT).order_by(ViewGetSalesProd.PROFIT)
    valREG = ViewGetSalesSum.query.with_entities(ViewGetSalesSum.PROFIT)
    valPROD = ViewGetSalesSum.query.with_entities(ViewGetSalesProd.PROFIT)

    ds_lblREG = []
    for rec in lblREG:
        ds_lblREG.append(rec[0])
    #print(ds_lblREG)

    ds_lblPROD = []
    for rec in lblPROD:
        ds_lblPROD.append(rec[0])
    

    ds_valREG = []
    for rec in valREG:
        ds_valREG.append(rec[0])

    print("DS VAL REG")
    print(ds_valREG)

    ds_valPROD = []
    for rec in valPROD:
        ds_valPROD.append(rec[0])


#data=data, lblREG=ds_lblREG,lblPROD=ds_lblPROD,valREG=ds_valREG,valPROD=ds_valPROD,title="Sales Data" 

    return render_template('salesdatasum.html', data=data , data2=data2, lblREG=ds_lblREG ,  valREG=ds_valREG , lblPROD=ds_lblPROD, valPROD=ds_valPROD, title="Sales Data" )