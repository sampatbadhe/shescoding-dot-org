# [She's Coding](http://shescoding.org)

This is the code for the [shescoding.org](http://shescoding.org) website.

### About *She's Coding*

*She's Coding* is an open-source website project currently under development in cooperation with the documentary film [CODE: Debugging the Gender Gap](http://www.codedoc.co/). She’s Coding is meant to serve as the destination for anyone who wants to learn more about the gender gap problem in computer science and become part of the solution.

**Open-source?**

Yes! *She's Coding* is build by the community, for the community. We currently have a small group of volunteers bootstrapping the project, and we are in the process of defining some simple rules on how to contribute for the wider community.

[Let us know](mailto:info@shescoding.org) if you want to join our team!

### Installation

+ Install [Homebrew](http://brew.sh/) (OSX):

  ```
  $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

+ Set the [Ruby](https://www.ruby-lang.org/en/) version to 2.3.1. In order to be able to pick the ruby version or to download ruby, we recommend using a ruby version manager. There are 2 ruby version management tools: [rvm](https://rvm.io/) and [rbenv](https://github.com/rbenv/rbenv).

    ##### **RVM**
    ##### Installing **rvm** from scratch:

	+ Install [rvm](https://rvm.io/):
      ```
      $ \curl -sSL https://get.rvm.io | bash -s stable
      ```

	+ Install [Ruby](https://www.ruby-lang.org/en/):
      ```
      $ rvm install 2.5.3
      ```

	+ Select this version of ruby for use in this project:
      ```
      $ rvm use 2.5.3
      ```

    ##### Set ruby version if you already have rvm installed:
    + Select this version for use:

      ```
      $ rvm use 2.5.3
      ```

    ##### **RBENV**
    ##### Installing **rbenv** from scratch:
    + Install [rbenv](https://github.com/rbenv/rbenv):
      ```
      $ brew install rbenv
      ```

	+ Install [Ruby](https://www.ruby-lang.org/en/):
      ```
      $ rbenv install 2.5.3
      ```

	+ Check ruby version:
      ```
      $ ruby -v
      ```
   	You should see ruby version printed as result: `ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin15]`


   ##### Set ruby version if you already have rbenv installed:
   + Change your ruby version locally inside shescoding-dot-org repository:

      ```
      $ cd shescoding-dot-org
      $ rbenv local 2.5.3
      ```

+ Install [Postgresql](http://www.postgresql.org/)
  + Mac:

    Install:
    ```
    $ brew install postgresql
    ```

    Initialize the postgres database:
    ```
    $ initdb /usr/local/var/postgres
    ```

    Start the postgres server:
    ```
    $ pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
    ```

  + Ubuntu:

    See [https://help.ubuntu.com/community/PostgreSQL]

    For simple setup (local use only) follow the "Alternate Server Setup" of the
resource provided above.

+ Set up the database:
  ```
  $ createdb shescoding_development
  $ psql -d shescoding_development -c "CREATE USER shescoding WITH PASSWORD 'shescoding'"
  $ psql -d shescoding_development -c "GRANT ALL PRIVILEGES ON DATABASE shescoding_development to shescoding"
  ```

+ Set up your local repo
  + Fork the repository by hitting the "Fork" button on the shescoding github page.
  + Clone the repository:

    ```
    $ git clone https://github.com/shescoding/shescoding-dot-org.git
    ```
  + Add the upstream repository:

    ```
    $ git remote add upstream https://github.com/shescoding/shescoding-dot-org.git
    ```

+ Load all the gems:
  ```
  $ bundle install
  ```

+ Run database migrations:
  ```
  $ rake db:migrate
  ```

+ Seed the database:
  ```
  $ rake db:seed
  ```

+ Start the Rails server:
  ```
  $ rails s
  ```

+ Visit the project at [localhost:3000](http://localhost:3000)

### Pre-commit hook

Please do not commit and push directly to the master branch! The hooks/pre-commit file in this repository contains a pre-commit hook that warns you if you are checking directly into master. In order to enable this hook, from the root of the repo do:
```
$ cp hooks/pre-commit .git/hooks/
$ chmod +x .git/hooks/pre-commit
```

### Running the tests

In order to run the tests, make sure all the gems are installed and the test environment is set up properly with working database.

+ Set up:

```
$ bundle install
$ bundle exec rake db:create RAILS_ENV=test
$ bundle exec rake db:schema:load RAILS_ENV=test
```

+ Run the tests with [RSpec Rails](https://github.com/rspec/rspec-rails):

```
$ bundle exec rspec -fd
```

Notes:
+ ```-fd``` stands for full details. You can also run tests by using commands ```bundle exec rspec``` or ```bundle exec rake``` to get an overview without details of each test.
+ If you are having trouble running bundle install, please make sure Nokogiri gem is installed on your machine. Full instructions can be found [here](http://www.nokogiri.org/tutorials/installing_nokogiri.html).
