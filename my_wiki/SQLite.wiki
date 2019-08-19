= SQLite =
As of writing, sqlite3.

== How to do things ==

=== How to prepopulate a database ===
To begin, SQLite is a bit weird. A database is not created like it is using MySQL. Instead, the database is named and created on the command line.

`sqlite3 test.db < my_script.db`
