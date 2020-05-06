:elixir:

# OTP: Applications
In OTP an _application_ is a a bundle of code with a descriptor to tell the runtime what dependencies it needs, what global names it registers and other data about itself.
Programming Elixir mentions it's closer to a shared object than a typical application.
Like a *component* or *service*

## Application Specification File
The `*.app` files that mix sometimes creates are application specification files
It's a compilation of info from the `mix.exs` file and other notes from compiling the program

For an example, when you create a project with mix, inside `mix.exs` there will be an `application` function created that returns a keyword list.
The `mod` keyword is a tuple that holds the main module as the first element and any arguments as the rest of the elements

To *register* a namespace so other applications that use your application don't clash add the modules as a list under the `registered` keyword
I.e. `registered: [ MyServer.Router ]`
