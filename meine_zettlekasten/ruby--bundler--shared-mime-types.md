:ruby:problems-and-solutions:

# The Error
```
Fetching gem metadata from https://rubygems.org/............
Resolving dependencies.....
Using rake 13.0.3
Using concurrent-ruby 1.1.8
Using minitest 5.14.4
Using zeitwerk 2.4.2
Using builder 3.2.4
Using erubi 1.10.0
Using racc 1.5.2
Using crass 1.0.6
Using ffi 1.15.0
Using nio4r 2.5.7
Using rack 2.2.3
Using rb-fsevent 0.10.4
Using method_source 1.0.0
Using thor 1.1.0
Using semantic_range 3.0.0
Using bundler 2.2.13
Using msgpack 1.4.2
Using turbolinks-source 5.2.0
Using regexp_parser 2.1.1
Using websocket-extensions 0.1.5
Using rubyzip 2.3.0
Using rack-test 1.1.0
Using rb-inotify 0.10.1
Using rack-mini-profiler 2.3.1
Using rack-proxy 0.6.5
Using sprockets 4.0.2
Using sassc 2.4.0
Using puma 5.2.2
Using bootsnap 1.7.2
Using turbolinks 5.2.1
Using websocket-driver 0.7.3
Using listen 3.4.1
Using tilt 2.0.10
Using mini_mime 1.0.2
Using public_suffix 4.0.6
Using mail 2.7.1
Using addressable 2.7.0
Using byebug 11.1.3
Using sqlite3 1.4.2
Using i18n 1.8.9
Using childprocess 3.0.0
Using tzinfo 2.0.4
Using selenium-webdriver 3.142.7
Using nokogiri 1.11.2 (x86_64-darwin)
Using spring 2.1.1
Using loofah 2.9.0
Using activesupport 6.1.3
Using rails-html-sanitizer 1.3.0
Using rails-dom-testing 2.0.3
Fetching mimemagic 0.3.7 (was 0.3.6)
Using xpath 3.2.0
Using globalid 0.4.2
Using capybara 3.35.3
Using jbuilder 2.10.0
Using webdrivers 4.6.0
Using bindex 0.8.1
Using actionview 6.1.3
Using activemodel 6.1.3
Using actionpack 6.1.3
Using activerecord 6.1.3
Using actioncable 6.1.3
Using railties 6.1.3
Using sprockets-rails 3.2.2
Using web-console 4.1.0
Using sassc-rails 2.1.2
Using activejob 6.1.3
Using sass-rails 6.0.0
Using actionmailer 6.1.3
Using webpacker 5.2.1
Installing mimemagic 0.3.7 (was 0.3.6) with native extensions
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.

current directory:
/Users/brendonsoto/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/mimemagic-0.3.7/ext/mimemagic
/Users/brendonsoto/.rbenv/versions/2.6.3/bin/ruby -rrubygems
/Users/brendonsoto/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/rake-13.0.3/exe/rake
RUBYARCHDIR\=/Users/brendonsoto/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/extensions/x86_64-darwin-19/2.6.0/mimemagic-0.3.7
RUBYLIBDIR\=/Users/brendonsoto/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/extensions/x86_64-darwin-19/2.6.0/mimemagic-0.3.7
rake aborted!
Could not find MIME type database in the following locations:
["/usr/local/share/mime/packages/freedesktop.org.xml",
"/opt/homebrew/share/mime/packages/freedesktop.org.xml",
"/usr/share/mime/packages/freedesktop.org.xml"]

Ensure you have either installed the shared-mime-types package for your distribution, or
obtain a version of freedesktop.org.xml and set FREEDESKTOP_MIME_TYPES_PATH to the location
of that file.

Tasks: TOP => default
(See full trace by running task with --trace)

rake failed, exit code 1

Gem files will remain installed in
/Users/brendonsoto/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/mimemagic-0.3.7 for
inspection.
Results logged to
/Users/brendonsoto/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/extensions/x86_64-darwin-19/2.6.0/mimemagic-0.3.7/gem_make.out

An error occurred while installing mimemagic (0.3.7), and Bundler cannot continue.
Make sure that `gem install mimemagic -v '0.3.7' --source 'https://rubygems.org/'` succeeds
before bundling.

In Gemfile:
  rails was resolved to 6.1.3, which depends on
    actionmailbox was resolved to 6.1.3, which depends on
      activestorage was resolved to 6.1.3, which depends on
        marcel was resolved to 0.3.3, which depends on
          mimemagic
toy_app (main) Δ λ gem install mimemagic -v '0.3.7' --source 'https://rubygems.org/'
Building native extensions. This could take a while...
ERROR:  Error installing mimemagic:
        ERROR: Failed to build gem native extension.

    current directory: /Users/brendonsoto/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/mimemagic-0.3.7/ext/mimemagic
/Users/brendonsoto/.rbenv/versions/2.6.3/bin/ruby -rrubygems /Users/brendonsoto/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/rake-13.0.3/exe/rake RUBYARCHDIR\=/Users/brendonsoto/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/extensions/x86_64-darwin-19/2.6.0/mimemagic-0.3.7 RUBYLIBDIR\=/Users/brendonsoto/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/extensions/x86_64-darwin-19/2.6.0/mimemagic-0.3.7
rake aborted!
Could not find MIME type database in the following locations: ["/usr/local/share/mime/packages/freedesktop.org.xml", "/opt/homebrew/share/mime/packages/freedesktop.org.xml", "/usr/share/mime/packages/freedesktop.org.xml"]

Ensure you have either installed the shared-mime-types package for your distribution, or
obtain a version of freedesktop.org.xml and set FREEDESKTOP_MIME_TYPES_PATH to the location
of that file.

Tasks: TOP => default
(See full trace by running task with --trace)

rake failed, exit code 1

Gem files will remain installed in /Users/brendonsoto/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/mimemagic-0.3.7 for inspection.
Results logged to /Users/brendonsoto/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/extensions/x86_64-darwin-19/2.6.0/mimemagic-0.3.7/gem_make.out
```

# What caused this?
- make new rails app (6.1.3)
- switch Gemfile to the one below
- run `bundle install`
- save changes
- try to push to heroku
- get error message similar to [this](./ruby-bundle-dep-version-not-found.md)
- try solution in above file
- get new message (above)
- try updating `mimemagic` again
- push to heroku again

Gemfile:
```
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails',      '6.1.3'
gem 'puma',       '5.2.2'
gem 'sass-rails', '6.0.0'
gem 'webpacker',  '5.2.1'
gem 'turbolinks', '5.2.1'
gem 'jbuilder',   '2.10.0'
gem 'bootsnap',   '1.7.2', require: false

group :development, :test do
  gem 'sqlite3', '1.4.2'
  gem 'byebug',  '11.1.3', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console',        '4.1.0'
  gem 'rack-mini-profiler', '2.3.1'
  gem 'listen',             '3.4.1'
  gem 'spring',             '2.1.1'
end

group :test do
  gem 'capybara',           '3.35.3'
  gem 'selenium-webdriver', '3.142.7'
  gem 'webdrivers',         '4.6.0'
end

group :production do
  gem 'pg', '1.2.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# Uncomment the following line if you're running Rails
# on a native Windows system:
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
```


# Solution
- install [shared-mime-info](https://freedesktop.org/wiki/Software/shared-mime-info/) for your OS
- `bundle update`
