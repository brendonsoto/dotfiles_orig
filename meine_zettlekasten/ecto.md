:elixir:

# Ecto
Ecto is a framework for managing database transactions and connections using Elixir

## Changesets
A changeset holds all of the changes to be made to a db
They handle any *casting* and *validation* to the data before it goes to the db
Why handle it this way?
To separate the concerns
In Programming Phoenix a really good case against coupling the validation logic to the schema is to prevent having a "one-size-fits-all" solution
Different updates requires different contexts
Hence the separation

Changesets have an *action* field
This is `nil` when a changeset is first created
But if any validation errors occur then the action field will be set

## Migrations
Migrations change a db to reflect the data structure the application uses

To create a migration run the following on the command line:
`mix ecto.gen.migration <migration_name>`
This will create a file where db modifications can be coded
To act on them, run `mix ecto.migrate`
Any changes will be made for the *current environment*
