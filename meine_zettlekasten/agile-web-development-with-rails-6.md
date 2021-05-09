:book:rails:ruby:

# Part 1
## 1 - Installing Rails
Requirements:
- Ruby

To install Rails 6 w/o docs: `gem install rails --version=6.0.1 --no-document`


## 2 - Instant Gratification
### Creating a New Application
There's a `bin` dir that holds executables related to the rails app
An alternative to using the `bin` commands is to use `bundle exec <task>`
I wonder why they accomplish the same thing but in two diff ways

**Create a new Rails app**: `rails new <app-name>`

**Get info about current app**: `bin/rails about`

**Run the app**: `bin/rails server`


### Linking Pages
**Link**: `<%= link_to "Anchor Text", controller_action_path %>`
- interpret `controller_action_path` literally. If you're going to `MyController::MyRoute` the second arg would be e`mycontroller_myroute_path`
- `link_to` is a _helper_

Where are other helpers defined?

`*.html.erb` files = views
Code w/in `<%= ... %>` is evaluated


## 3 - The Architecture of Rails Applications
Convention over configuration

I realized I never really knew what this meant
This phrase states that to work with rails is to work with a defined set of opinions (convention) instead of having a flexible framework to cater to your needs (configuration)
---

MVC:
- created 1979 by Trygve Reenskaug
- models:
  - responsible for state
  - Also responsible for business rules
  - "The model acts as both a gatekeeper and a data store"
- views:
  - user interface
  - consumes data from the model
- controllers:
  - conductor
  - takes the incoming route, gets the data from the model, pipes it to a view and spits the result out

**Action** = the method a controller calls for a certain route

POST methods are associated with the `create` function

**Active Record** = The ORM Rails uses

**Action Pack** = a component for faciliatating the work done by views and controllers

Dynamic content can come in:
- *.html.erb pages
- dynamic javascript snippets
- xml/json

Controller magic is behind the scenes
Controllers manage:
- routing requests to actions
- caching
- importing/managing helper modules
- session management


## 4 - Introduction to Ruby
- local variables begin with lower case
- instance variables begin with `@`
- prefer_snake_case
- class names, modules, and constants Must Start With Capital
- symbols begin with a colon (i.e. `:symbol`) and are like strings that are magically turned into constants
- define methods with `def my_method(param) ... end`
- `return` is optional. the last expression is returned if there is no `return`
- `# this is a comment`
- **printing**: `puts`
- strings:
  - `'this will print w/o a newline\n'` -> 'this will print w/o a newline\n'
  - `"this will print w/ a newline\n"` -> 'this will print w/ a newline'
- **interpolation** uses `#{...}` (i.e. `def greet(name) puts "hello #{name}!}" end`)
- `nil` is its own object
- **appending to an array**: `arr << new_val`
- `['this', 'array', 'is'] === %w{ this array is }`
- `{ :this => 1, :is => 2, :a => 3, :hash => 4 }`
- `my_hash = { this: 1, is: 2, also: 3, hash: 4 }`
- hashes don't have to be in parens when the las argr
- regex: `/pattern/` or `%r{pattern}`

### Logic
- **conditionals**:
  - if/elif/else:
  ```
  if cond1
    # do thing
  elif cond2
    # do other thing
  else
    # do last thing
  end
  ```
  - while:
  ```
  while cond
  end
  ```
- **blocks**:
  - single line: `{ puts 'hello' }`
  - multi line: `do ... end`
  - passing to function w/ args: `my_func(p1, p2) { ... }`
  - to pass things to the block: `print_animals(animals) { |animal| puts animal }`
  - capture blocks in methods using `&` (i.e. `def do_thing &b ... end`)
- misc:
  - `times`: (i.e. `3.times print 'choo' # choo choo choo`)
- **Exceptions**:
  - `Exception` class
  - `raise` is like `throw` in JS
  - `begin ... rescue ... end` is like `try catch` in JS
  ```
  begin
    # try risky thing
  rescue SpecificExceptionClass
    # log
  rescue OtherException
    # log still?
  end
  ```

### Classes
```
# From the book -- added comments and spacing

class Order < ApplicationRecord             # Make a class called "Order" that inherits "ApplicationRecord"
  has_many :line_items                      # 'has_many' is a method from ActiveRecord
  def self.find_all_unpaid                  # define a class method 'find_all_unpaid'
    self.where('paid = 0')                  # `.where` is an ActiveRecord method
  end                                       # end method 'find_all_unpaid'
  def total                                 # define method 'total'
    sum = 0                                 # set local variable 'sum' to '0'
    line_items.each {|li| sum += li.total}  # 'each' method call to add line item totals to the sum
    sum                                     # tells the method to return the value of 'sum'
  end                                       # end method
end                                         # end class
```

- **class method**: a method that can be called w/o making an instance of the class
- getters and setters:
  - `attr_accessor :symbol` - creates get and set for `:symbol`
  - `attr_reador :symbol` - creates get for `:symobl`
  - `attr_writer :symbol` - creates set for `:symbol`
- methods can be `protected` or `private`

### Modules
- Modules are another way to share methods between classes w/o using inheritance
- multiple modules can be used in one class
- multiple classes can use the same module/s
- Rails uses them as helper functions

```
module HelperMethods
  def trim_whitespace(str)
    # trim
  end
end
```

### Marshaling Objects
- **marshaling**: storing an object outside of the running application by converting the object into a stream of bytes
  - NOTE: Not all objects can be marshaled because they can't be dumped
    - `TypeError`s will arise in these cases
  - NOTE: When restoring a marshaled object, the object's definition is needed prior to marshaling
  - marshaling is used to manage session data


### Idioms
- `method!`: the `!` at the end indicates destructive behavior (i.e. writing data to the same object)
- `method?`: the `?` at the end indicates a boolean will be returned
- `x || y`: if `x` is defined return `x` otherwise `y`
- `x ||= y`: `x` remains the same if `x` is not `nil` or `false` otherwise sets `x` to the value of `y`
- `obj = self.new`: seems like duplicating the object, but flexible enough to acoomodate for subclasses
Say you have two classes, one extends the other, and the parent class has a method that returns `self.new`
Calling the method on the parent class will give you a new object of the parent class
Calling the method on the child class will give you a new object of the child class
```
class A
  def self.get_new
    self.new
  end
end

class B < A
end

A.get_new # new 'A' object
B.get_new # new 'B' object, not 'A'
```
Compare that to
```
class A
  def self.get_new
    A.new
  end
end

class B < A
end

A.get_new # new 'A' object
B.get_new # new 'A' object, not 'B'
```
- **lambda**: `->`
- `require File.expand_path('../../config/environment', __FILE__)`:
  - `require`: loads external file into the current area
    - useful for adding third party code
  - `__FILE__`:
    - special var representing the absolute path to the current file
  - `File.expand_path(rel_path_to_file, abs_path)`:
    - uses `abs_path` to generate an absolute path to the directory and then navigates to the file in `rel_path_to_file`
