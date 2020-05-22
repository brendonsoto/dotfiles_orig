:phoenix:

# Routes
There are four parts to routing in phoenix:
- `router.ex`: the brains
- controllers: define the functionality and get any data needed for views
- views
- templates

## Creating a Route
Say you're starting a fresh Phoenix project and want to add a route to the `PageController`

### Router
First, in `router.ex` look for the existing `PageController` route (should be just for the index page)
It should look something like this:
`get "/", PageController, :index`
Notice the format
`<http-verb> <route>, <controller>, <function>`

So if you wanted to post info to the index route it would look like:
`post "/", PageController, :create`

### Controller
From here open your controller and add a function to correspond to whatever you wrote in the router

*NOTE*
Most controller functions follow the convention:
`def <name>(conn, attrs)`
The *attrs* param represents query parameters, but with *strings* as *keys*, not *atoms*
Thus, destructuring is needed, as so:
`def create_item(conn, %{"item" => item})`

This is told in the [Phoenix Conventions](./phoenix-conventions.md) page too.
