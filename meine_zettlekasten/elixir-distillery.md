:elixir:distillery:

# Distillery
Distillery is an Elixir package for making releases
It can take a project and reduce it into a single deployable file

Add the dependency to your `mix.exs` file like any other dependency

To *begin the release process* run `mix distillery.init`
This should create a `rel` directory with a `config.exs` file in it

Create a `config` directory with a file `config.exs` in it
It can be empty
Why?
To be honest I'm not super sure
The overview in the Programming Elixir book about this was a bit broken
I had to go through the closed issues for the Distillery project on github to figure out what my problem was

To *build*: `mix distillery.release --env=prod`

The main file you're looking for to deploy is the `*.tar.gz` file

To create an *upgrade*: `mix distillery.release --env=prod --upgrade`
Once the upgrade is made you can *upgrade* the app by using `<path-to-app-binary> upgrade <version>`
You can also *downgrade* using `downgrade`
