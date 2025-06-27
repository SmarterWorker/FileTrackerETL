from flask import Blueprint, render_template, request, flash, redirect
import os
from datetime import datetime, timedelta
from flask.helpers import flash, url_for
#from filemanager.filestatus.forms import AddTestForm
from filetracker.filestatus.models import *

no_days = 500
prev_days = datetime.today() - timedelta(days = no_days) # datetime(datetime.today().year, datetime.today().month, datetime.today().day)
#d_fca = ViewGetTransFCA().query.filter(ViewGetTransFCA.last_write_time >= prev_days).order_by(ViewGetTransFCA.last_write_time.desc())
print(prev_days)
filestatus = Blueprint('filestatus', __name__, template_folder='templates', static_folder='static')

filestatus_home = Blueprint('filestatus_home',__name__,template_folder='templates',static_folder='static', url_prefix='/')
filestatus.register_blueprint(filestatus_home)
@filestatus_home.route("/")
@filestatus_home.route("/home")
def home():
    print("Found Home Page Route!")
    page = request.args.get('page', 1, type=int)
    #files = ViewGetLastStatusFiles().query.filter(ViewGetLastStatusFiles.last_write_time >= prev_days).order_by(ViewGetLastStatusFiles.created_at.desc()).paginate(page=page, per_page=100)
    files = ViewGetLastStatusFiles().query.order_by(ViewGetLastStatusFiles.created_at.desc()).paginate(page=page, per_page=100)

    print(files)
    return render_template('filestatus.html', files=files, title='File Status')

filestatus_search = Blueprint('filestatus_search',__name__,template_folder='templates',static_folder='static', url_prefix='/filesrch')
filestatus.register_blueprint(filestatus_search)
@filestatus_search.route("/filesrch")
def filesearch():
    files = ViewGetLastStatusFiles().query.order_by(ViewGetLastStatusFiles.created_at.desc())
    return render_template('srchfilests.html', files=files, title='All File Search')

filestatus_refdata = Blueprint('filestatus_refdata',__name__,template_folder='templates',static_folder='static', url_prefix='/refdata')
filestatus.register_blueprint(filestatus_refdata)
@filestatus_refdata.route('/refdata')
def refdata():
    d_status = ViewStatus().query.order_by(ViewStatus.group_name,ViewStatus.sort_order )
    d_ftp = ViewFtpConfig().query.order_by(ViewFtpConfig.id)
    d_types = ViewFileTypes().query.order_by(ViewFileTypes.file_type_id)
    d_config = ViewFileConfig().query.order_by(ViewFileConfig.ft_cfg_ref)
    return render_template('refdata.html', status=d_status, ftp=d_ftp, types=d_types, file=d_config, title="Reference Data")

filestatus_filename = Blueprint('filestatus_filename',__name__,template_folder='templates',static_folder='static', url_prefix='/files/')
filestatus.register_blueprint(filestatus_filename)
@filestatus_filename.route("/files/<string:filename>")
def files(filename):
    #data = ViewGetFileHistory().query.filter_by(file_filename=name)\
    data = ViewGetFileHistory().query.filter_by(file_name=filename).order_by(ViewGetFileHistory.created_at.desc())
    return render_template('fileinfo.html', data=data, title='File Audit')

