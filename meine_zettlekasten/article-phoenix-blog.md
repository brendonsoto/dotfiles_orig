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

Let's run `mix test` to make sure we didn't break anything. D'oh! A new error! But at least we caught it now rather than later! The failure has to do with creating a user. If we look closer we see it involves the `create` function in the `user_controller` which is the function we just changed! On a closer look we see we're passing in a map with just a name and an email, but no password. Let's try adding in a password to the input map. Voila! Fixed!

Alright, we see the user has been made, now let's repeat what we did earlier in iex to check for the hash.

Success! We have our `password_hash` in the database!

Now we have to figure out logging in, logging out, and keeping a user logged in once they've either registered or have logged in. In other words, session state. Let's focus on Logging in first.


## Log In
We have an ability to create users. Let's think of what it means to log into a site.

Assuming a user sends their credentials to the server and the creds check out then the user would be considered "logged in" and have the ability to use certain pages that are blocked from non-registered users. The user would need some sort of signifier to show they are allowed to see the pages. It would be annoying to have to fill out a log in form for every page! This is where the idea of *session* comes into place.

In order to log in they'll need a _form_ to fill out the relevant information. For simplicity's sake let's make the log in page it's own page instead of a component that can be reused. This form will need a _post route_ to validate the information. Lastly, we'll need a way to _delete_ the session if a user decides to log out.

Before we start, let's take a moment to think about the steps we could take here. One route would be the following:

- Create a "Session" controller with show/create/delete routes
- Create the login form
- Check that the data is available in the create method
- Create the validation and session creation functionality
- Create the delete functionality

This seems straightforward, but consider how the testing experience would be. For the login form we'd manually verify the form is there. Then for the create information we'd have to inspect or log the data somehow which would involve using the form. Then we'd have to create the functionality which we could test using unit tests, but then we'd have to manually verify again by going through the route. If we were to focus on the functionality first, then we'd save ourselves a few rounds of manual testing. With that said, our gameplan will be:

- Create the validation functionality
- Create a "Session" controller with show/create/delete routes
- Create the login form
- Create the session creation functionality
- Create the delete functionality

Let's get started.


### Validation Functionality
Let's think what's involved with validating a user. We have a function that has a set of credentials that need to be verified against the database. We could either find the user, a different user, or no user at all.

How will we verify the credentials? Hash the given password and compare against the two strings? Thankfully we don't have to worry about the details! The library we're using has a function to verify a password, called `verify_pass`, which we'll use.

Lastly, where should this functionality live? This has to do with users so maybe the Accounts context will be best. Following in the steps of Programming Phoenix we'll use the Accoutns context.

We'll start with a simple test. We'll need an easy way to create users. Thankfully the generator created a `user_fixture` function for us to create users. Remember though that the generator only had email and name properties so we'll have to add password to it.

```
# In test/blog/accounts_test.exs

describe "users" do
  @valid_attrs %{email: "unit@test.com", name: "unit", password: "TestingTesting"}
  @update_attrs %{email: "some updated email", name: "some updated name"}
  @invalid_attrs %{email: nil, name: nil}

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Accounts.register_user()

    user
  end

  ...
end

```

We modified a _fixture_, which is apparently a term used in the testing world for creating mock data structures easily, that takes a map of attributes to use. We modified the `valid_attrs` to include the password, as well as a few tweaks to its params. Finally, we switched out `create_user` for `register_user`. Let's double check we didn't break anything else now by running the tests.

Lots of errors! Let's look for any patterns before we tackle them one by one.

The majority of them seem to be expecting no password instead of a default. Outside of that there's an email mis-match and then our one purposefully erroneous test.

Why would our passwords not persist in our models? We're saving our passwords. Oh wait! It's not the passwords we're saving, but the hashes themselves!

This is actually a tricky situation. Let's look at this problem through the lens of the `list_users/0` test. We know our `register_user` function is used in the fixture. We also know that it inserts a user into the database. We know  we're comparing the return of `list_users`, which gets data _from the database_, against our user that was _created from a fixture_. The fixture ends with the `register_user` function which itself ends with a call to `Repo.insert`. If we look in the docs for the return value of `insert` we see it returns the _struct_, not necessarily the row in the database. Since our `password` field is set to be a "virtual" field it is ignored when saved to the database, but perserved in our struct hence the mismatch.

Our options are either to delete the tests, or match on a particular quality. Let's modify the tests to do the latter starting with `list_users`.

```
# In test/blog/accounts_test.exs

...
test "list_users/0 returns all users" do
  %User{id: id} = user = user_fixture()
  assert [%User{id: ^id}] = Accounts.list_users()
end
...
```

To start off we added a small portion to where we create our user. It may look a bit confusing at first, but think of it as a sort of destructuring while maintaining the original object. I find it easier to read it from right to left. In this case, we're saying "call the `user_fixture` function, set it's value to the variable `user` and then match it against a `User` struct so we can have a reference to the `id` property.". A mouthful, but better to be explicit than implicit!

The assert statement we switched around. The first thing you'll notice is that we switched the order of the function call and the expectation. Why? To pattern match using the result of the `list_users` call. This is also why we're using a single equals sign instead of a double. We know `list_users` returns an array of `User`s but we don't want to compare all of the structs, just the IDs. This is where the pin (`^`) operator comes in. If we didn't have that, we'd be trying to reassign `id`. With the pin we're using pattern match to to look for a `User` struct with a _specific_ `id` value.

Let's repeat this for the other tests that are failing due to the `password` field.

```
# In test/blog/accounts_test.exs

...
test "get_user!/1 returns the user with given id" do
  %User{id: id} = _user = user_fixture()
  assert %User{id: ^id} = Accounts.get_user!(user.id)
end

...
test "update_user/2 with invalid data returns error changeset" do
  user = user_fixture()
  assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
  user_result = Accounts.get_user!(user.id)
  assert user.id == user_result.id
end
```

Only thing different here is the underscore in front of `user` in the `get_user` test. This is because we don't use the `user` variable and it prevents mix from yelling at us. Let's test. We should only see two failures now. Success! Granted, the `update_user` test is a bit silly since we're comparing by id's and used the same id in the `get_user` call. It's your call whether to remove the test or keep it in.

Now let's check out that email error. It's just for one test, `create_user` with valid data, so we can inspect that test.

This looks simple! We're comparing the attribute values to different hard-coded values. Easy fix! Switch the hard-coded values and we should be all set.

Now that we have that we can get to testing our password validation function.

```
# In test/blog/accounts_test.exs

describe "authenticating" do
  test "authenticate with valid credentials" do
    password = "SuperSecret"
    user = user_fixture(password: password)

    assert {:ok, auth_user} = Accounts.authenticate_user(user.email, password)

    assert user.id == auth_user.id
  end
end
```

We set up a suite using `describe` and created our first test for valid users. Running this test we see it fails which is just what we expected. Let's create the missing function now.

```
# In lib/blog/accounts.ex

@doc """
Validates a given set of credentials against the db.
Returns a tuple where the first element is an atom to describe success or failure.
The second element is either the user or an atom describing the failure.
"""
def authenticate_user(email, given_pass) do
  user = get_user_by(email: email)

  cond do
    user && Pbkdf2.verify_pass(given_pass, user.password_hash) ->
      {:ok, user}
  end
end
```

The doc string is to keep our documentation game strong. For the function itself we start out by getting the user. We use this as a means to quickly check if we have to verify the given password. How can we if the user doesn't exist! Now let's add a test case for an incorrect user.

```
# In test/blog/accounts_test.exs

describe "authenticating" do
  ...

  test "authenticate with invalid credentials" do
    password = "SuperSecret"
    user = user_fixture(password: password)

    assert {:error, :unauthorized} = Accounts.authenticate_user(user.email, "incorrect")
  end
end
```

Red! Now to add the case if the user exists, but the password doesn't match. This is kind of taken care of by the first case, so if that doesn't pass we know we have a user, but an incorrect password. That enables us to make just a small change.

```
# In lib/blog/accounts.ex

def authenticate_user(email, given_pass) do
  user = get_user_by(email: email)

  cond do
    user && Pbkdf2.verify_pass(given_pass, user.password_hash) ->
      {:ok, user}

    user ->
      {:error, :unauthorized}
  end
end
```

Green! That leaves us with our last case. What if the user doesn't exist? We can just shortcut to the error tuple too, but Programming Phoenix recommends an alternate approach to prevent timing attacks using the `no_user_verify` function from the pbkdf2 library. Their solution below.

```
# In lib/blog/accounts.ex

def authenticate_user(email, given_pass) do
  user = get_user_by(email: email)

  cond do
    user && Pbkdf2.verify_pass(given_pass, user.password_hash) ->
      {:ok, user}

    user ->
      {:error, :unauthorized}

    true ->
      Pbkdf2.no_user_verify()
      {:error, not_found}
  end
end
```

To test we can just pass in invalid credentials.


```
# In test/blog/accounts_test.exs

...
test "missing user" do
  assert {:error, :not_found} = Accounts.authenticate_user("nope", "nah")
end
```

Still green! We have successfully implemented basic password checking!


### Test Performance
At this point you may have notice the tests take some time. We can speed it up by running tests within a file in parallel like so:

```
# In test/blog/accounts_test.exs

defmodule Blog.AccountsTest do
  use Blog.DataCase, async: true
  ...
```

Additionally, remember that hashing can be expensive. We can cut down on the rounds of hashing in our tests through the config files.

```
# In config/test.exs

...
config :pbkdf2_elixir, :rounds, 1
```

If you've been following along at this point you should notice a drastic difference. On my machine the test time went from 6.5 to 0.2 seconds!


### Creating a Session Controller
We have our validation function set and tested so now it's a matter of where to include it. This should happen when a user logs in which would be in the controller that handles the log in info, the Session controller.

Let's start off by creating a controller just with the route for the form.

```
# In lib/blog_web/controllers/session_controller.ex

defmodule BlogWeb.SessionController do
  use BlogWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
```

Nothing new is going on here. We create a module for the controller and create a function for rendering the `new.html` page. This isn't useful unless if we add it to our router.

```
# In lib/blog_web/router.ex

scope "/", BlogWeb do
  ...
  resources "/sessions", SessionController, only: [:new]
end
```

We've seen the `resources` keyword before for our Users controller. Despite having only one route so far we know we're going to need one for posting data and another for deleting so might as well add the keyword in now. The section at the end starting with `only` is a way to restrict the allowable routes. Here we're saying only allow a "new" route.

Before we can fire it up, we need to add a Session view and flesh out `new.html`.

```
# In lib/blog_web/views/session_view.ex

defmodule BlogWeb.SessionView do
  use BlogWeb, :view
end
```

Nothing new for our view.

```
# In lib/blog_web/templates/session/new.html.eex

<h1>Log In</h1>

<%= form_for @conn,
Routes.session_path(@conn, :create),
[as: :session],
fn f -> %>
  <div>
    <%= text_input f, :email, placeholder: "Email" %>
  </div>
  <div>
    <%= password_input f, :password, placeholder: "Password" %>
  </div>
  <%= submit "Log in" %>
<% end %>
```

As a whole everything is pretty familiar. There's markup, functions for creating different inputs and a submit button. What we're passing into the `form_for` function may seem a bit weird. Looking at the hex docs helps a lot, but let's go over it together.

We have four parameters here:
- `@conn`: a data structure implementing the `Phoenix.HTML.FormData` protocol
- `Routes.sesion_path(..)`: where to send the data
- `[as\: \:session]`: options; here we're saying "prepend the data with `session.`"
  - the forward slashes are to try to get around vimwiki
- `fn f ->`: an anonymous function to use to build the markup

Altogether it's a way to create a form to send data to a path where the data is formatted like `session.email: ..., session.password: ...`. We're using `@conn` as the first parameter because we don't have a particular changeset associated this information.


#### Posting Data
We started this course thinking we would only need to create the `new` route, but looks like we'll need to create the `create` section of the controller first so the compiler doesn't yell at us!

Let's think through what the flow will look like. The user sends their credentials. We verify their data and if it checks out we give them some token to allow them access to other pages on the site. We'll hold off on that token bit for now and use redirects to determine validity on the client side. If everything checks out, to the index page you go with a little flash message saying you've logged in. Otherwise redirect back to the log in page.

```
# In lib/blog_web/router.ex

...
scope "/", BlogWeb do
  ...
  resources "/sessions", SessionController, only: [:new, :create]
end
```

```
# In lib/blog_web/controllers/session_controller.ex

...
def create(
  create,
  %{"session" => %{"email" => email, "password" => pass}}
) do
  case Blog.Accounts.authenticate_user(email, pass) do
    {:ok, _user} ->
      conn
      |> put_flash(:info, "Welcome!")
      |> redirect(to: Routes.page_path(conn, :index))

    {:error, _reason} ->
      conn
      |> put_flash(:error, "Invalid credentials")
      |> render("new.html")
  end
end
```

Overall we have a function that takes two parameters, one of them we destructure using pattern matching, and determine where to redirect to based on the result of our authentication function using the two parameters.

Let's try it out. Run `mix phx.server`, navigate to "localhost:4000/sessions/new". Our form appears! Let's try some credentials of a user we previously created and logging in with the same email, but a different password. Success!


#### Adding Some Sort of Session Token
Now that we have the ability to log in we need to create a way to _stay_ logged in. This is where sessions come in. Sessions confused me a bit so here's a quick run down.

A *session* is a way to create state when visiting a website. HTTP is _stateless_ so there's no way to track changes between pages/network requests. A session is created on the back end as a data structure with an ID. This ID is passed to the client side so the client can refer to the session. On subsequent network requests the client can send the session ID in order to get any stored information or update the session.

Quick side note, in order to protect users from a type of attack called a _fixation_ attack it is recommended to generate a new session ID when creating a session. This is what we will do.

So how do we create a session and add things to it? Through a combination of the `Plug.Conn` functions `put_session` and `configure_session`. The former adds data to the session while the latter is to do things like generate new session IDs, drop sessions, and ignore changes. We can make a function that adds the user id to the session and then creates a new session ID for security's sake.

Where should this function live? It's going to be used for both the new log in page as well as registration pages so it shouln't be tied to either or. Let's add it in its own module in the `controllers` directory.

```
# In lib/blog_web/controllers/auth.ex
defmodule BlogWeb.Auth do
  def login(conn, user) do
    conn
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end
end
```

Why do we need `conn` in this function? Because the session functions take a connection as their first parameter! Think of it like this, how can you create a session if you don't know anything about the HTTP connection?

Now we can add this function into our log in and registration controller actions.

```
# In lib/blog_web/controllers/session_controller.ex

def create
  ...
  case Blog.Accounts.authenticate_user(email, pass) do
  {:ok, user} ->
    conn
    |> BlogWeb.Auth.login(user)
    |> put_flash(:info, "Welcome!")
    |> redirect(to: Routes.page_path(conn, :index))
  ...
end

```

Now for the registration action.

```
# In lib/blog_web/controllers/user_controller.ex

def create
  ...
  case Accounts.register_user(user_params) do
    {:ok, user} ->
      conn
      |> BlogWeb.Auth.login(user)
      |> put_flash(:info, "User created successfully.")
      |> redirect(to: Routes.user_path(conn, :show, user))
  ...
end

```

Before we can test this out we have to think about what the end result would look like! Once logged in a user would be able to access user-only pages. We don't have any pages yet. We could create some
