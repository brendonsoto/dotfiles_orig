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


# How to render a template
`render_template(template, ...any_data_used_by_the_template)`


# Function for urls
Instead of hardcoding urls, use `url_for('url_name')`.


# Flask Shell
There's a convenient flask command, `flask shell`, that starts up the REPL and loads in the flask application
This can be modified to include more than just the app, like the db or its models, through the `@app.shell_context_processor` decorator


# Flask extensions
Most flask extensions are prefixed using `flask_`
For *forms*, `flask_wtf` is handy
For *databases/orms*, `flask_sqlalchemy` is great!


## Flask SQLAlchemy
The `flask_sqlalchemy` is a package to introduce *SQLAlchemy* to Flask

It introduces the following commands to the flask CLI:
- `flask db init` -- Initializes the db
- `flask db migrate -m "my message"` -- Creates a migration script w/ comment
- `flask db upgrade` -- Runs through any new migration scripts and applies them
- `flask db downgrade` -- Rollsback most recent change

Models are represented as classes

For more info, check out [the documentation](https://flask-sqlalchemy.palletsprojects.com/en/2.x/)!
The quickstart covers a fair amount!
