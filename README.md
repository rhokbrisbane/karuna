Karuna
======

Information portal for Karuna - [karuna.org.au](http://karuna.org.au/)


### Development

**Requires Ruby, Postgres & Node/NPM**

  git clone git@github.com:rhokbrisbane/karuna.git
  bundle install

  npm install -g bower
  bower install

Create a `config/database.yml` file using `config/database.yml.sample` with your Postgres config

  bundle exec rake db:setup
  bundle exec rails s

