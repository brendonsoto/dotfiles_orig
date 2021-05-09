:ruby:

# Idioms
For more see [4-introduction-to-ruby](./agile-web-development-with-rails-6.md###introduction-to-ruby)

## Ruby Lang (site)
[Source](https://www.ruby-lang.org/en/documentation/ruby-from-other-languages/)

- `$var`: `$` indicates global variable
- `@@var`: `@@` indicates class variable
- you can have keywords as params in functions and provide args to specific keywords:
  - `def send_mail(from: 'joe@mama', to: nil, subject: 'Girl Scout Cookies')`
  - `send_mail(to: 'shee@eee') # retains defaults of 'joe@mama' and 'Girl Scout Cookies'`
- `nil` and `false` are the only **falsy** values
- access modifiers (i.e. `protected` and `private`) are applied to all methods and variables after the keyword
```
class Accessible
  def public_method
  end

  protected
  def protected_method
  end

  private
  def private_method
  end

  def other_method # still private
  end
end
```
- `self` can be the only receiver of a `private` function
- `protected` methods can be called by not only w/in its class and subclasses, but by other instances of the same class
- you can modify any class (including builtin ones like `Integer`) :/


## Zen Spider
https://www.zenspider.com/ruby/quickref.html
