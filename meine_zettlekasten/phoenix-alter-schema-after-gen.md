:phoenix:

This is related to [authentication](./phoenix-authentication.md)

# Alter Schema After Generation
Say you've created a schema, controller, and views using:
`mix phx.gen.html Accounts User users name:string, email:string`

You add the `resources` snippet as the instructions tell you to

*Do not* run `mix ecto.migrate` yet

You then add password fields to the schema like so:

```
schema "users" do
  ...
  field :password, :string, virutal: true
  field :password_hash, :string
end
```

And you change the migrations file to include the `password_hash` alongside any unique constraints

```
def change
  create table(:users) do
    ...
    add :password_hash, :string
  end

  create unique_index(:users, [:email])
end
```

You *now* run `mix ecto.migrate`
And now your tests should run successfully.

If you were to add in the migrations prior to making the schema + db changes then they will fail with db errors
