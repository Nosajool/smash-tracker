source 'https://rubygems.org'


ruby '2.3.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.

gem 'faker'

gem 'bootstrap-sass'
gem 'will_paginate-bootstrap'

gem 'pg'

group :doc do
	gem 'sdoc'
end

group :development, :test do
	gem 'spring'
	gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
	gem 'pry-byebug'
	gem 'better_errors'
end

group :test do
  gem 'minitest-reporters'
  gem 'timecop'
end

group :production do
	gem 'rails_12factor'
end
