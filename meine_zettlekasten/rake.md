:ruby:

[source](https://ruby.github.io/rake/)

# What is rake?
Rake is a Ruby form of `make`
Instead of Makefiles you have _Rakefiles_


# Why is this a thing?
Rake looks like it was made to avoid some of the quirks/downfalls of make like:
- weird syntax
- xml

And add other benefits like:
- parallel execution
- tasks can specify prerequisites
- other helper conveniences


# How to...
## Install
`gem install rake`


## Make a Task
No params: `task :<name>`
Params: `task <name>: [:<arg1>, :<arg2>, ...]`



## Use
`rake` -- runs the default task
`rake ...` -- runs w/e task w/ whatever args (TODO Make better example)
