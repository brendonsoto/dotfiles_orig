# Python
:python:


# Virtual environment (venv)
This is Python's approach to keeping dependencies and projects isolated from each other
To create a virtual environment: `python3 -m venv venv`
To start the virtual environment: `source venv/bin/activate`
To end the virtual environment: `deactivate`
The `deactivate` command is automatically brought in when the virtual environment is started


# Packages
A *package* is a subdirectory that has a `__init__.py` file
This file acts as the public interface describing what's available from the subdirectory for consumption
There is a variable, `__name__`, which is available within a package and is just the name of the module/subdirectory
