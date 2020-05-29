:elixir:phoenix:

# Pow
This is a library/module that provides authentication and user management for Elixir/Phoenix apps.


# Kudos / Acknowledgements
All info here has been derived from the following:
- https://experimentingwithcode.com/phoenix-authentication-with-pow-part-1/
- https://hexdocs.pm/pow/README.html#installation


# Dependency Installation
Adding Pow seems different than other dependencies. You add the dependency to `mix.exs` and run `mix deps.get`, just like any other dependency, but afterwards you run `mix pow.install` to actually install the dependency.


# Configuration
Post installation a prompt will appear telling you to make three modifications:
- appending code to `config/config.exs`
- adding Pow's session plug into `lib/<project>_web/endpoint.ex`
- adding a `scope` to `lib/<project>_web/router.ex`

NOTE: This will break your tests so you will have to modify them.

Follow the instructions. There is more to add in the third (router) than just the new `use` statement and new `scope` block. To set up a system to restrict access to certain pages to logged in users the following is needed:

```
# In lib/<project>_web/router.ex

# ... pipelines

pipeline :protected do
  plug Pow.Plug.RequireAuthenticated,
    error_handler: Pow.Phoenix.PlugErrorHandler
end

# ... after the new scope with pow_routes

scope "/", <Project>Web do
  pipe_through [:browser, :protected]

  # Add protected routes here
end
```

We created a new pipeline to ensure a user is authenticated and then we added a scope for routes available to authenticated users only.


# Migrations
Pow creates a migration file upon installation so run `mix ecto.migrate` to persist those changes.


# What Pow Introduces
At this point Pow has introduced a `users` table with its own schema and routes to create, show, update, and delete user accounts. Cool! It also exposes the user data structure through the `current_user` variable for all of the pages to use.

Log in and out routes are accessible by using `Routes.pow_session_path(@conn, :<fun>)`

Registration and editting account routes are accessible by using `Routes.pow_registration_path(@conn, :<fun>)`

In the above, `<fun>` is a placeholder for the HTTP method functions like `:new` and `:delete`.

As an example of all of this, here is what a "Register" link may look like:
`<%= link "Register", to: Routes.pow_registration_path(@conn, :new) %>`


# Restricting a Route to Authenticated users
Simply put the route in the scope block that uses the `:protected` pipeline.


# Modifying Pow Registration Controller
See here: https://hexdocs.pm/pow/custom_controllers.html#content


# Cheatsheet
## How to Remove Confirm Password
I had to dive into the source code for this! When you add Pow, as is, the registration view includes three fields: email/id, password, and confirm password. Confirm password is not great for UX so I was looking for a way to remove it. Simply removing the field from the template file does not work. This is because the changeset passed through looks for the confirm password field. So we need a way to remove it or redo the changeset. The latter is what's necessary.

Thankfully it's easy to do! Make changes to your `lib/<project>/users/user.ex` file like so:

```
defmodule App.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  import Pow.Ecto.Schema.Changeset, only: [new_password_changeset: 3]

  schema "users" do
    pow_user_fields()

    timestamps()
  end

  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> pow_user_id_field_changeset(attrs)
    |> new_password_changeset(attrs, @pow_config)
  end
end
```

Not much is being changed. There's a new import statement at the top. TODO Why?

Outside of that the only addition is the changeset. The function looks like any other changeset function. We're just limiting our changeset validations to two checks: id and password.


### Default Changeset
The default changeset can be found in `deps/pow/lib/pow/ecto/schema.ex` by searching for `def pow_changeset` (as of v1.0.20). The defaults look like this:

```
@spec pow_changeset(Ecto.Schema.t() | Changeset.t(), map()) :: Changeset.t()
def pow_changeset(user_or_changeset, attrs) do
  user_or_changeset
  |> pow_user_id_field_changeset(attrs)
  |> pow_current_password_changeset(attrs)
  |> pow_password_changeset(attrs)
end
```

If you search for any of the chained functions you will not find anything. They are defined dynamically. There is a module attribute, `@changeset_methods`, that is a keyword list that looks very similarly to our chained functions, but without the `pow_` prefix. Then there's a macro definition, `__pow_methods__`, that shows the `pow_` functions reference the changeset functions in `pow/lib/pow/ecto/schema/changeset.ex`. So to find the changeset for `pow_user_id_field_changeset` open `pow/lib/pow/ecto/schema/changeset.ex` and search for `user_id_field_changeset` (note the lack of the prefix).


# Questions:
- What about email confirmation/reset password?
