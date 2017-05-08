# Smash Bros Match Tracker
Just a little stat tracking app for us to keep track of who beats who in Super Smash Bros 4. [http://smash-tracker.herokuapp.com/](http://smash-tracker.herokuapp.com/)

### TODO
* Make it so that winner cannot be the loser
* Character Pictures on Profile and when creating a Match
* Recent Match Layout
* More statistics in profile section. eg:
	* Characters you've 4 stocked with
	* Time and Date of match
* Show match statistics between 2 players

### Dev Setup
* Install Postgres
* Create Postgres user with username: "smash-tracker"
* `bundle exec rake db:create`
* `rails s`
* `bundle exec rake db:seeds`
* `bundle exec rake db:populate`
* Go to [http://localhost:3000/](http://localhost:3000/)
