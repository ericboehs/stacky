source 'https://rubygems.org'

gem 'rails', '~> 5.0.0.beta3'

gem 'devise',       '~> 4.0.0.rc2'  # Flexible authentication with Warden
gem 'high_voltage', github: 'thoughtbot/high_voltage' # Easily include static pages
gem 'pg',           '~> 0.18.0' # Use postgresql as the database for Active Record
gem 'puma',         '~> 3.3.0'  # Fast, threaded web server
gem 'que',          '~> 0.11.0' # Job queue that uses PostgreSQL's advisory locks

gem 'bootstrap-sass',  '~> 3.3.0'  # Add bootstrap css framework
gem 'coffee-rails',    '~> 4.1.0'  # Use CoffeeScript for .js.coffee assets & views
gem 'jquery-rails',    '~> 4.1.0'  # Use jQuery for its JavaScript utilities
gem 'sass-rails',      '~> 5.0.0'  # Use SASS for stylesheets
gem 'simple_form',     '~> 3.2.0'  # Forms made easy
gem 'slim-rails',      '~> 3.0.0'  # Succinct view template language similar to HAML
gem 'turbolinks',      '~> 5.0.0.beta' # Follow links faster via AJAX
gem 'uglifier',        '>= 1.3.0'  # Compressor for JavaScript assets

group :development, :test do
  gem 'pry-awesome_print'  # Auto awesome print in pry
  gem 'pry-rails'          # Adds pry, an interactive REPL debugger; Try show-models
  gem 'spring'             # Speed up development by keeping your application running
end


group :test do
  gem 'minitest-spec-rails' # The minitest gem that uses existing Rails dirs
  gem 'poltergeist'         # PhantomJS driver for Capybara
  gem 'purdytest'           # 57 lines of code to colorize minitest
  gem 'selenium-webdriver'  # For running tests in your browser
end

group :production do
  gem 'rack-timeout', '~> 0.4.0'  # Terminate long running requests
end
