# Python

## Problems & Solutions
Pip not working due to self signed cert

Solution:
https://stackoverflow.com/questions/39356413/how-to-add-a-custom-ca-root-certificate-to-the-ca-store-used-by-pip-in-windows

tl;dr
Find the self signed cert and add it to pip via
`pip3 config set global.cert $HOME/certs/root-bundle.crt/pem`

## Flask
I'm following along https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world

### Chapter 1
I had no idea that `virtualenv` was a program specifically for Python2. I thought it worked for all versions of Python. Now I know Python3 has its own virtualenv setup which can be run `python3 -m venv venv` The first `venv` is the function call and the second is just the name of the directory holding all of the `venv` goodies.

*NOTE*: To deactivate/exit venv, run `deactivate` on the command line. The command becomes available once in a venv session.

Additionally, I already really like this tutorial.  One thing that really bothered me working with Python for the nand2tetris book was the concept of modules and seeing module names referenced inside the modules themselves. That always weirded me out. The same concept is happening now, where we have a directory named `app` and an `__init__.py` file that references `app` in itself (specifically `from app import routes`). The author clarifies that the reference to `app` here is really a reference to Flask.

The author mentions circular imports are a problem with Flask applications. Nice thing to have in mind. It's also nice he mentions how to clear that up. He mentions the `routes` file imports the `app` variable, so then to get around the circular dependency the import for `route` (`from app import routes`) is at the bottom of the file since the `app` var is declared before the app import.

At first I was wondering why do we have `from app import app` from both a file inside the `app` package and a file outside of the package, but then remembered that `app` is defined as the Flask instance.

I'm at the end of the chapter now. Standard hello world, but a nice intro into the parts that make it happen. To recap:
- We made a module/package to hold our app in
- In this module we have an `__init__.py` file to import Flask and set it to a variable for other files to reference
- We defined our routes using decorators specific to Flask
- We installed a dependency to prevent exporting the `FLASK_APP` env var every time we run the app


### Chapter 2 -- Templates
- Jinja is included with Flask!
- use `render_template` to render markup from wherever
This chapter was on templating with Jinja. More specifically:
- What Jinja is
- conditional rendering
- extending other templates/inheritance
- for loops

The most important takeaway wasn't necessarily a Python/Flask thing. It was to take advantage of creating mock objects when designing a front end. Be mindful of what names you use for the objects/properties.


### Chapter 3 -- Web Forms
- Introduces the concept of Flask extensions with a form extension
- work done using the form extension
- to protect against CSRF (with the current extensions) all that is needed are:
  - SECRET_KEY config var to be defined
  - Include a `form.hidden_tag()` in the template
- the extension includes validation and error messages out of the box which is quite nice
- unlike express, you can declare multiple HTTP Methods within a route declaration:
  - I do not like this because it can seem a bit confusing to follow the logic path, but who knows if this is considered pythonic or if there's a better way


### Chapter 4 -- Databases
- SQLAlchemy, an ORM, is being used since it allows db code to be written once, yet support multiple db structures (MySQL, Sqlite, Postgres, etc)
- In order to facilitate the growth of databases (i.e. changes in schema) *migrations* are needed
- I think I get the importance of migrations, but would like to see mroe info on it, more in depth stuff, a comparison of with and without it and an analysis of what you get vs the price paid
- It's nice that this is explaining what foreign-keys are
- *DB cycle*:
  - Create model via SQLAlchemy
  - Create migrations via `flask db migrate`
  - Run/Apply migrations via `flask db upgrade`
- Since SQLAlchemy is an ORM we have fucntions like `Users.query.all()` to get all users
- `flask shell`:
  - starts a REPL session with the app
  - it is possible to expose more modules to the REPL through the use of:
    - `@app.shell_context_processor\n def make_shell_context():

#### Questions
- What does it mean for a column to be "indexed"?


### Chapter 5 -- User Login
- Flask wraps the `Werkzeug` python library
- a good hashing function should be impure -- different results based on same params
- the security functions Werkzeugu comes with, mainly `generate_password_hash` and `check_password_hash` are awesome and make auth *SUPER* easy
- the `flask-login` extension provides remembering a user is logged in or not as they go through different pages and the ability to remember a user even if they close the browser
- Woohoo! Login, Logout, and Register functionality implemented and working
- Login:
  - A form is created with the required fields (username, password, remember me)
  - Once submitted we check that data exists and that there is no currently existing user
  - If all good then we use the function `login_user`, provided by the `flask-login` extension, to tell our app the user is logged in
  - If not, then we redirect to the login page again and `flash` some error messages to them
- Logout:
  - we use the `logout_user` function, also provided by `flask-login`, to log out the user and then redirect out
- Register:
  - Create form with fields (username, email, pw, pw2)
  - Create a route similar to Login
  - On submit, we create an object of the User class with the uname and email, add pw using `generate_password_hash`, and commit it to the db
  - Once done we redirect them and flash a message at them

#### Questions
What is netloc?
- netloc = Network Location. It's used to see if a url is absolute or relative. It can be useful for ensuring that redirect locations are only relative to prevent an attacker from using a malicious website in a redirect query param.

What are the arguments for a model class and what do they mean?
- It's multiple inheritance. The arguments state what to inherit/extend from.

### Chapter 6 --
