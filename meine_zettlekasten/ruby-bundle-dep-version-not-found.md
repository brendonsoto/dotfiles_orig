:ruby:problems-and-solutions:


# Problem
Heroku couldn't find a specific version of a dependency (mimemagic)
```
remote: -----> Installing dependencies using bundler 2.2.11
remote:        Running: BUNDLE_WITHOUT='development:test' BUNDLE_PATH=vendor/bundle BUNDLE_BIN=vendor/bundle/bin BUNDLE_DEPLOYMENT=1 bundle install -j4
remote:        Fetching gem metadata from https://rubygems.org/............
remote:        Your bundle is locked to mimemagic (0.3.5), but that version could not be found
remote:        in any of the sources listed in your Gemfile. If you haven't changed sources,
remote:        that means the author of mimemagic (0.3.5) has removed it. You'll need to update
remote:        your bundle to a version other than mimemagic (0.3.5) that hasn't been removed
remote:        in order to install.
```


# How did the problem start?
`git push heroku main`


# Solution
- Find a non "yanked" version of the dependency from https://rubygems.org/
- Update _Gemfile_ to have the dependency pointing to the available version
- `bundle update <dependency>`
- Generating a data model using scaffolding is similar to Elixir + Phoenix:
  - `rails generate scaffold ModelName field1:string field2:int etc`
- To persist: `rails db:migrate`
- scaffolded model pages do not include validation or personalization
- variables prefixed with `@` are **instance variables**
- inheritance provides a lot of the functionality for model classes/objects
- erb is the default template lang
