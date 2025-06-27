from filetracker import create_app

# allows to run the webserver using python flaskblog.py rather than setting env
# set env variables for FLASK i.e
# set FLASK_ENV=development
# set FLASK_APP=run.py
# FLASK_DEBUG=1
# Fin

app = create_app()

if __name__ == '__main__':
    app.run()