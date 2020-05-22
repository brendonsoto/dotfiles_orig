:phoenix:

# Seeding Data
Let's say you have an application that's connected to a database and there's a field or table that does not have a web interface for it
How do you populate data to it if not through the app?

One approach would be to use the REPL to manually add in data, but that's not a great idea since every developer would have to do the same thing
Additionally a race case may come about if two people are trying to write at the same time

The more ideal solution is to *seed data*
Phoenix provides a script, `priv/repos/seeds.exs`, to add any seeding
After you added your code, run the script using `mix run priv/repos/seeds.exs`
