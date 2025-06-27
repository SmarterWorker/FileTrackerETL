call start_flask20.bat
title File Tracker App with Python 3.9.2 and Flask2.0 port 5010
h:
cd H:\workarea\DataB\projects\source_control\code\filetracker\frontend
h:
rem python run.py
rem ./manage.py runserver 0.0.0.0:9000

SET FLASK_APP=run.py
SET FLASK_ENV=development
SET FLASK_DEBUG=1
REM flask run --host=0.0.0.0 --port 5010
flask run --host=192.168.50.6 --port 5010