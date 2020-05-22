:elixir:

# Testing Gotchas

## Pattern Matching Assertions
This I learned working with Phoenix
Let's use the context of Phoenix and testing models as an example
Say you have a model, `Item`, and have a function to get all items
In your test you create some items, add them to the db, and then query for all
To assert what you get is what you received you would do something like:
`assert [%Item{prop1: ^val1}] = Items.get_all()`
This is saying "assert that the array with prop1 as val1 is the same as what you get from calling Items.get_all"
The _pin_ is to use a pre-existing value to match, one we would get from creating an item using something like `{:ok, item} = create_item_fixture()`
