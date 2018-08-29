[![Build Status](https://travis-ci.org/JayKay24/ride_sharing_app.svg?branch=test-motor-pool-160057260)](https://travis-ci.org/JayKay24/ride_sharing_app)
[![Maintainability](https://api.codeclimate.com/v1/badges/029e518a71b8c7d8b4df/maintainability)](https://codeclimate.com/github/JayKay24/ride_sharing_app/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/JayKay24/ride_sharing_app/badge.svg?branch=test-motor-pool-160057260)](https://coveralls.io/github/JayKay24/ride_sharing_app?branch=test-motor-pool-160057260)

# Motor Pool App

Motor Pool App is a carpooling application that provides drivers with the ability to create ride offers and passengers 
to join available ride offers. The Heroku link can be found [here](https://motor-pool.herokuapp.com/):

#### Getting Started

```
$ git clone https://github.com/JayKay24/ride_sharing_app.git
$ cd ride_sharing_app
```


#### Prerequisites

The Gemfile contains multiple gems to get you up to date with the dependencies
needed to run the application.
On the command line. Type:

```
$ cd ride_sharing_app
$ bundle install
(- For the next step, you will need to enter your database credentials first before proceeding)
$ rails db:migrate
$ rails server
```

#### Running the tests

On the command line, type:
```
$ bundle exec rspec
```

#### Deployment

Follow the steps to deploy the application to Heroku. You will need the Heroku
command line tool for this. Download it [here](https://devcenter.heroku.com/start).

```
$ heroku login
Enter your Heroku credentials.
Email: ruby@example.com
Password:
$ heroku create
$ git push heroku <most_recent_branch>:master -f
$ heroku open
```


#### License

The MIT License (MIT)

Copyright (c) 2018 James Kinyua Njuguna

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#### Built With

* Ruby 2.5.1
* Rails 5.2.1


#### Authors

James Kinyua Njuguna


#### Acknowledgements
* Hat tip to anyone whose code was an inspiration for towards building Erudite.
* Ruby documentation
* Ruby Cookbook by Lucas Carlson & Leonard Richardson
