from filetracker import db
from flask_sqlalchemy import SQLAlchemy

class ViewGetLastStatusFiles(db.Model):
    __tablename__ = 'vw_get_last_status_files'
    file_name = db.Column(db.String(100), primary_key=True)
    folder_name = db.Column(db.String(100))
    file_type_id = db.Column(db.String(20))
    file_status_id = db.Column(db.String(20))
    record_count = db.Column(db.Integer)
    last_write_time = db.Column(db.DateTime)
    Notes = db.Column(db.Text)
    sort_order = db.Column(db.Integer)
    size_kb = db.Column(db.Integer)
    key_status = db.Column(db.Integer)
    fhashcount = db.Column(db.Integer)
    filecount = db.Column(db.Integer)
    created_at = db.Column(db.DateTime)

class ViewStatus(db.Model):
    __tablename__ = 'vw_get_file_status'
    id = db.Column(db.Integer, primary_key=True)
    file_status_id = db.Column(db.String(20))
    detailed_info = db.Column(db.String(45))
    is_active = db.Column(db.Integer)
    sort_order = db.Column(db.Integer)
    group_name = db.Column(db.String(20))
    key_status = db.Column(db.Integer)

class ViewFileTypes(db.Model):
    __tablename__ = 'vw_get_file_types'
    id = db.Column(db.Integer, primary_key=True)
    file_type_id = db.Column(db.String(20))
    detailed_info = db.Column(db.String(45))
    ft_cfg_ref = db.Column(db.String(20))
    is_active  = db.Column(db.Integer)

class ViewFtpConfig(db.Model):
    __tablename__ = 'vw_get_ftp_config'
    id = db.Column(db.Integer, primary_key=True)
    config_ref = db.Column(db.String(20))
    config_name = db.Column(db.String(100))
    file_type_id = db.Column(db.String(20))
    source_folder = db.Column(db.String(100))
    dest_folder = db.Column(db.String(500))
    file_status_id = db.Column(db.String(20))
    archive_locs = db.Column(db.String(500))
    private_key = db.Column(db.String(100))
    hostname = db.Column(db.String(100))

class ViewFileConfig(db.Model):
    __tablename__ = 'vw_file_type_config'
    id = db.Column(db.Integer, primary_key=True)
    ft_cfg_ref = db.Column(db.String(20))
    cfg_option = db.Column(db.String(100))
    cfg_value = db.Column(db.String(100))

class ViewGetFileHistory(db.Model):
    __tablename__ = 'vw_get_files'
    file_name = db.Column(db.String(100))
    folder_name = db.Column(db.String(100))
    file_type_id = db.Column(db.String(20))
    record_count = db.Column(db.Integer)
    file_status_id = db.Column(db.String(20))
    notes = db.Column(db.Text)
    created_at = db.Column(db.DateTime)
    last_write_time = db.Column(db.DateTime)
    file_ext = db.Column(db.String(5))
    size_kb = db.Column(db.Integer)
    key_status = db.Column(db.Integer)
    file_hash = db.Column(db.String(100))
    fhashcount = db.Column(db.Integer)
    id = db.Column(db.Integer, primary_key=True)
#ViewGetSearch
class ViewGetSearch(db.Model):
    __tablename__ = 'vw_get_search'
    file_name = db.Column(db.String(100), primary_key=True)
    folder_name = db.Column(db.String(100))
    file_type_id = db.Column(db.String(20))
    file_status_id = db.Column(db.String(20))
    record_count = db.Column(db.Integer)
    last_write_time = db.Column(db.DateTime)
    Notes = db.Column(db.Text)
    sort_order = db.Column(db.Integer)
    size_kb = db.Column(db.Integer)
    key_status = db.Column(db.Integer)
    fhashcount = db.Column(db.Integer)
    filecount = db.Column(db.Integer)
    created_at = db.Column(db.DateTime)
