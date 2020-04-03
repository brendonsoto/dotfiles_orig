# Flask
:python:flask:


# How to set up a Flask app
```
# in app/__init__.py...
from flask import Flask

app = Flask(__name__)

from app import routes


# in top level python file to kick off the app...
from app import app
```
Then export an environment variable that points to the top level script
`export FLASK_APP=toplevel.py`
Or use the `python-dotenv` package
Command line: `pip install python-dotenv`
In `.flaskenv`: `FLASK_APP=toplevel.py`


# How to set up routes
```
# in routes.py...
from app import app

@app.route('/')
def index():
  ...
```
