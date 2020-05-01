# OTP
:elixir:

OTP stands for *Open Telecom Platform*
It was originally created to build telephone exchanges and switches
It includes Erlang, a database called Mnesia, and a lot of libraries
It includes a structure for your application so it's basically a framework

"OTP defines systems in terms of hierachies of _applications_" (Programming Elixir, p230)
An application is 1 or more processes that follow OTP conventions/behaviors
There are conventions for the following:
- general-purpose servers
- implementing event handlers
- finite-state machines

Some examples are:
- GenServer -- the general-purpose server behavior
- supervisor -- different from the above categories, this monitors processes and helps in restarting them if needeed
