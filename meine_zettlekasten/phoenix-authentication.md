:phoenix:

# Authentication
Authentication makes me nervous
It feels like so much can go wrong!
Here is what I've learned from the Programming Phoenix book

# Adding the Dependencies
Add a cryptography library like comeonin or guardian
Here we'll be talking about comeonin since that's what the book used
The dependency to add will look like this:
```
# In mix.exs
{:pbkdf2_elixir, "~> 1.0"}
```
And afterwards: `mix deps.get`

# How to Add Auth to User Changesets
This assumes you're working with a User model
You'll have a changeset for Users
Originally my thought was to add to this changeset
But changesets are chainable!
This means we can *include* the basic user changeset into a changeset for *registering* users!
The *benefit* to this is it enforces having *one changeset per case*
That would look something like:
```
def registration_changeset(user, params)
  user
  |> changeset(params)
  |> validate_required([:password])
  |> ... more password validations
  |> put_pass_hash()
end
```

Everything except for `put_pass_hash` should look familiar
Let's check that function out

# put_pass_hash
This is where you create and add a hash for the password!
It's separated in a separate function because it could be a potentially expensive operation
The idea is to check that the changeset given is valid, and if so then hash
Otherwise, just return the changeset as is and let the db handle the failure

*Remember* changesets are structs so you'll want to match against something like:
`%Ecto.Changeset{valid?: true, changes: %{password: pass}}`

# Bridge 1
Now we have our schema, database, and changesets aligned
Next step is to create functions that use our new changeset to add a user
Let's do it with a TDD mindset

# Testing
If you used `mix phx.gen.html` you should have tests automatically created for you
Open up the user test file created and we can start to add our password changesets

Create a new test suite (i.e. `describe...`) and add in valid and invalid cases to test against

Then we can test against a `register_user` function where we call the function with valid/invalid params and assert the expected response alongside the expected properties of the newly added user

At this point if you were to run `mix test` you should see an error that the `register_user` function does not exist
Time to add it!

# Side Note 1 - Initial thoughts
At this point my initial thoughts were to change the `create_user` function since that was how we add users to the database

In Programming Phoenix, the approach they take is to create a *separate* function for registering users
The reason for this is to provide a way to create users *for other APIs*
The examples they give involve:
- seeding data
- sending user invitations
- imports

# Creating register_user
This function will look like the `create_user` function, but with the `registration_changeset` instead of the base changeset

Run the tests, they should pass now!

# Manually Testing
Let's check out our work by firing up the server
