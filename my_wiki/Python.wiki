= Python =

== Problems & Solutions ==
Pip not working due to self signed cert

Solution:
https://stackoverflow.com/questions/39356413/how-to-add-a-custom-ca-root-certificate-to-the-ca-store-used-by-pip-in-windows

tl;dr
Find the self signed cert and add it to pip via
`pip3 config set global.cert $HOME/certs/root-bundle.crt/pem`

== Flask ==
I'm following along https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world

=== Chapter 1 ===
I had no idea that `virtualenv` was a program specifically for Python2. I thought it worked for all versions of Python. Now I know Python3 has its own virtualenv setup which can be run `python3 -m venv venv` The first `venv` is the function call and the second is just the name of the directory holding all of the `venv` goodies.

Additionally, I already really like this tutorial.  One thing that really bothered me working with Python for the nand2tetris book was the concept of modules and seeing module names referenced inside the modules themselves. That always weirded me out. The same concept is happening now, where we have a directory named `app` and an `__init__.py` file that references `app` in itself (specifically `from app import routes`). The author clarifies that the reference to `app` here is really a reference to Flask.

The author mentions circular imports are a problem with Flask applications. Nice thing to have in mind.

At first I was wondering why do we have `from app import app` from both a file inside the `app` package and a file outside of the package, but then remembered that `app` is defined as the Flask instance.

I'm at the end of the chapter now. Standard hello world, but a nice intro into the parts that make it happen. To recap:
- We made a module/package to hold our app in
- In this module we have an `__init__.py` file to import Flask and set it to a variable for other files to reference
- We defined our routes using decorators specific to Flask
- We installed a dependency to prevent exporting the `FLASK_APP` env var every time we run the app

