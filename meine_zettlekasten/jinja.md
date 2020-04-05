# Contents
  - [Jinja](#Jinja)
  - [Overview](#Overview)
  - [Extending templates](#Extending templates)
  - [Content](#Content)
  - [Conditionals](#Conditionals)
  - [For loops](#For loops)
  - [Referencing data](#Referencing data)

# Jinja
:jinja:python:


# Overview
Jinja is a templating language for Python.
I dig it.
Templates are written primarily in normal HTML with some syntactical sugar


# Extending templates
To extend a template:
`{% extends "myTemplate.html" %}`
This assumes both the template and the file extending it are in the same directory


# Content
`{% block content %}stuff?{% endblock %}`


# Conditionals
```
{% if condition %}
{% else %}
{% endif %}
```


# For loops
```
{% for thing in things %}
{% endfor %}
```


# Referencing data
It's just like accessing properties from a dictionary/class/JSON/etc.
`{{ user.name }}`


# Dynamic context
There is syntax to use Python's `with` statement in Jinja:
`{% with myVar = myFunc}...{% endwith %}`
