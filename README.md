Apprentice News
===============

Apprentice News is a [Hacker News](https://news.ycombinator.com) clone built by the GDS apprentice technologists.

Technology
----------

Apprentice News is built using Ruby, Sinatra, and Postgres SQL. It has tests using RSpec and Capybara.

Running the code
----------------

Assuming you have [Bundler](http://bundler.io/) and [Postgres](https://www.postgresql.org/) installed:

```
bundle install
ruby create-database.rb
ruby ./main.rb
```

Running the tests
-----------------

```
bundle exec rspec
```

