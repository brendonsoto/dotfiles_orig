:ruby:rails:

This is from Michael Hartl's tutorials from learnenough.com

# Chapter 1
- rbenv -- ruby version manager
- bundler -- ruby's npm/package manager
- you can include the version of a program when using it
  - i.e. `rails _6.1.3_ new my_app`
- running the command to create a new rails app installs ALL of the deps (ruby + npm)
- rails uses yarn instead of npm
- there are a lot of files and directories automagically created
- use `bundle _2.2.13_ config set --local without 'production'` to setup bundler to not install production gems
- [Heroku](https://www.heroku.com) is the deployment option of choice for this book
- when pushing to heroku **use the main branch**
- a shortcut to push to heroku is `git push heroku`
- pushing to heroku triggers the production build


# Chapter 2
