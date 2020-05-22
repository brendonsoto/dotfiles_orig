:article:phoenix:

# Creating a Blog with Phoenix
They say teaching is the best way to learn right? I'm in the process of learning Phoenix and getting more comfortable with back end tasks. I thought this could be an opportunity for practice and sharing knowledge!

Another motivation for this is that I've felt concepts like creating and managing passwords and authentication is glossed over in most tutorials/books so maybe this could be an opportunity to talk about it.

I'm using this opportunity to document creating a blog with Phoenix as a way to practice using the framework, back end tasks, and explore my thought process.


# Prerequisites
- Basic knowledge of Elixir/Phoenix


# Getting Started
First let's create the base app using `mix phx.new Blog` and follow those prompts. Create a git repo if you'd like.

To get it out of the way now, in `mix.exs` let's add the `pbkdf2_elixir` pacakage from comeonin. This will be used for hashing passwords later.

```
# In mix.exs, deps function
...
{:pbkdf2_elixir, "~> 1.0"}
```


# Users
Let's leverage Phoenix's generators to create a foundation for users.

`mix phx.gen.html Accounts User users name:string email:string`

Password is left out intentionally for now since that will require some tweaking.

After all is generated *do not* migrate yet. Do add the `resources` line to `router.ex`. Afterwards let's add our password field into the schema and migrations first.


# Adding password fields
Let's take a moment to think about what it means to add a password to a user and what that might entail.

A password is sensitive information. It's something that shouldn't be stored in a database as is (i.e. in plain text form). So we'll need a way to have a temporary storage place for the password and then create a scrambled up version of it just in case someone gets access to the database.

Once created the next steps would be to implement the ability to log in and out of the site. This will involve comparing a password given in the log in phase to what's in the database by decrypting the database password.

So the registration flow boils down to:
Client
=> sends user info
=> Server
=> hashes password
=> saves to database

And the log in flow:
Client
=> sends user info
=> Server
=> gets user record where the info the client sent matches
=> decrypts password
=> compares decrypted password to user sent password
=> sends some token to grant access if valid


## Schema
In the schema file, `lib/blog/accounts/user.ex`, let's add two fields:
- `password`: will represent the plain text version of the password
- `password_hash`: the representation of the password the database will store

```
# in lib/blog/accounts/user.ex
...
schema "users" do
  ...
  field :password, :string, virtual: true
  field :password_hash, :string
end
```

The `virtual` keyword is to say "this is not a field to be stored in the database"


## Migrations
A migration file should've been created in `priv/repos/migrations`. Open that file and add the following:

```
# In auto-generated migration file
...
create table(:users) do
  ...
  add :password_hash, :string
end

create unique_index(:users, [:email])
```

We added our `password_hash` field which looks like the other fields so far. The last addition, `create unique...`, is to ensure that `email` values are unique. An attempt to add an email that's already in will result in an error.

*Now* we can run `mix ecto.migrate` to realize our database changes.


## Adding Passwords to Changesets
You'll have a `changeset` function for Users. Originally my thought was to add passwords to this changeset, but changesets are chainable! This means we can *include* the basic user changeset into a changeset for *registering* users! Another benefit, if not the main one, is this enforces having *one changeset per case*

The new changeset would look like:

```
def registration_changeset(user, user_params)
  user
  |> changeset(user_params)
  |> cast(user_params, [:password])
  |> validate_required([:password])
  |> validate_length(:password, min: 8, max: 20)
  |> put_pass_hash()
end
```

*NOTE:* The rules here are really simple. Don't do this for production. Use something like OWASP as a guide for more secure practices.

This new changeset is taking the `user` struct, creating a changeset out of it, and then calls `cast` _again_ to include the `password` field. Then some validation happens. Lastly the changeset is piped to the `put_pass_hash` function. Let's check that function out.

## put_pass_hash
This is where you create and add a hash for the password! It's a separate function since hashing could be a potentially expensive operation. The idea is to check that the changeset given is valid and if so then hash the password. Otherwise, return the changeset as is and let the database handle the failure.

*Remember* changesets are structs so you'll want to match against something like:
`%Ecto.Changeset{valid?: true, changes: %{password: pass}}`

With that in mind we can produce something like this (taken from Programming Phoenix):

```
  @doc """
  If the given changeset is valid, hash the password and add it
  """
  def put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(pass))

      _ ->
        changeset
    end
  end
```

Now we have our schema, database, and changesets aligned
Next step is to create functions that use our new changeset to add a user
Let's do it with a TDD mindset


## Testing
Phoenix should have automatically created tests for you from before. Open up the user test file created and we can start to add our password changesets.

Let's add in a new test suite base with a valid and invalid case.

```
# In test/blog/accounts_test.exs
describe "register_user" do
  @valid_attrs %{email: "test@test.com", name: "dude", password: "SuperSecret"}
  @invalid_attrs %{email: "test@test.com", name: "dude", password: nil}

end
```

Then we can test against a `register_user` function where we call the function with valid/invalid params and assert the expected response alongside the expected properties of the newly added user.

```
# In test/blog/accounts_test.exs
describe "register_user" do
  ...
  test "with valid data inserts user" do
    assert {:ok, %User{id: id}=user} = Accounts.register_user(@valid_attrs)
    assert user.email == "test@test.com"
    assert user.name == "dude"
    assert [%User{id: ^id}] = Accounts.list_users()
  end
end
```

At this point if you were to run `mix test` you should see an error that the `register_user` function does not exist Time to add it!


## Side Note - Initial Thoughts on Where to Add Registration
At this point my initial thoughts were to change the `create_user` function since that was how we add users to the database.

In Programming Phoenix, the approach they take is to create a *separate* function for registering users. The reason for this is to provide a way to create users *for other APIs*. The examples they give involve:
- seeding data
- sending user invitations
- imports


## Creating register_user
This function will look like the `create_user` function, but with the `registration_changeset` instead of the base changeset.

```
# In lib/blog/accounts/user.ex

```

Run the tests, they should pass now!


## Manually Testing
Let's check out our work by firing up the server. Since we don't have any navigation currently, we'll have to navigate to `/users/new` to see our creation form.

Oh wait! There's no field for the password!


## Adding a Password Field in the View
Phoenix generated the new user template based on the two fields we initially gave it: name and email. If we look into `lib/blog_web/templates/user/new.html.eex` we can see a reference to `form.html.eex`. Let's modify the file.

```
# In lib/blog_web/templates/user/form.html.eex
...
<%= label f, :password %>
<%= password_input f, :password %>
<%= error_tag f, :password %>
```

Our view has a password field now so let's try it!


## Manually Testing Revisited
It works! We're redirected to the "Show" page. To be super duper sure, let's check out the new user in iex and in the database.

```
# in the terminal after running "iex -S mix"
> alias Blog.Accounts
> Accounts.list_users()
[
  %Blog.Accounts.User{
    __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
    email: "test@testing.com",
    id: 1,
    inserted_at: ~N[2020-05-21 14:45:08],
    name: "Test",
    password: nil,
    password_hash: nil,
    updated_at: ~N[2020-05-21 14:45:08]
  }
]
```

Ruh-roh! Our `password_hash` field is `nil`. Let's double check in the database.

I'm no Postgres wizard so what I do to inspect the database is the following steps:
- run `sudo -u postgres -i` to gain root privileges while masquerading as `postgres`
- run `psql` to start the interface

```
# In psql
> \c blog_dev
> select * from users;
 id | name |      email       | password_hash |     inserted_at     |     updat
ed_at
----+------+------------------+---------------+---------------------+----------
-----------
  1 | Test | test@testing.com |               | 2020-05-21 14:45:08 | 2020-05-2
1 14:45:08
(1 row)
```

Confirmed that our `password_hash` field is missing! Let's save the discussion on whwether that should be a required field or not for later and figure out why the field is not saving.

We created a changeset specifically for registration and a function to register users. We never wired it up to the controller though! D'oh!


## Updating the Controller
Navigate to `lib/blog_web/controllers/user_controller.ex` and look for the `create` function.

```
# In lib/blog_web/controllers/user_controller.ex
def create(conn, %{"user" => user_params}) do
  case Accounts.create_user(user_params) do
    {:ok, user} ->
      conn
      |> put_flash(:info, "User created successfully.")
      |> redirect(to: Routes.user_path(conn, :show, user))

    {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "new.html", changeset: changeset)
  end
end
```

A change the call to `Accounts.create_user` to `Accounts.register_user` should do the trick. After the change is made reload the `/users/new` page and make a new user.

Alright, we see the user has been made, now let's repeat what we did earlier in iex to check for the hash.

Success! We have our `password_hash` in the database!

Now we have to figure out logging in, logging out, and keeping a user logged in once they've either registered or have logged in. In other words, session state. Let's focus on Logging in first.


## Log In
We have an ability to create users. Let's think of what it means to log into a site.

Assuming a user sends their credentials to the server and the creds check out then the user would be considered "logged in" and have the ability to use certain pages that are blocked from non-registered users. The user would need some sort of signifier to show they are allowed to see the pages. It would be annoying to have to fill out a log in form for every page! This is where the idea of *session* comes into place.
