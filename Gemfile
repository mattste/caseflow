source ENV['GEM_SERVER_URL'] || 'https://rubygems.org'

gem "caseflow", git: "https://github.com/department-of-veterans-affairs/caseflow-commons", ref: "c9680d17fff3d5070b12bfd3146319a57b5b8c4c"

gem "moment_timezone-rails"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', platforms: [:ruby,:mswin,:mingw, :mswin, :x64_mingw]
gem 'activerecord-jdbcsqlite3-adapter', platforms: :jruby
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# React
gem "react_on_rails", "~> 6.8.0"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'active_model_serializers', '~> 0.10.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Application server: Puma
# Puma was chosen because it handles load of 40+ concurrent users better than Unicorn and Passenger
# Discussion: https://github.com/18F/college-choice/issues/597#issuecomment-139034834
gem "puma", "~> 2.16.0"

# use to_b method to convert string to boolean
gem 'wannabe_bool'

# Style
gem "uswds-rails", git: "https://github.com/18F/uswds-rails-gem.git"

# BGS
gem 'bgs', git: "https://github.com/department-of-veterans-affairs/ruby-bgs.git", ref: '1156b0ea76b0e84e2e176c8506ba5a589177e413'

# PDF Tools
gem 'pdf-forms'
#
gem 'pdfjs_viewer-rails', git: "https://github.com/senny/pdfjs_viewer-rails.git", ref: 'a4249eacbf70175db63b57e9f364d0a9a79e2b43'

# Error reporting to Sentry
gem "sentry-raven"

# Used to colorize output for rake tasks
gem "rainbow"

# Used to speed up reporting
gem "parallel"

# execjs runtime
gem 'therubyracer', platforms: :ruby

gem 'pg', platforms: :ruby

gem 'connect_vbms', git: "https://github.com/department-of-veterans-affairs/connect_vbms.git", ref: "f561599c8b68806ae838530b2fc02d481157b02a"

gem 'redis-rails'

gem 'sidekiq'
gem "sidekiq-cron", "~> 0.4.0"

# remove when upgrading to rails 5
gem 'where-or'

gem 'prometheus-client'

gem 'request_store'

# State machine
gem 'aasm', '4.11.0'

gem 'font-awesome-sass'

gem 'redis-namespace'

# catch problematic migrations at development/test time
gem "zero_downtime_migrations"

# http client that uses libcurl(3) (as in curl command)
gem 'curb'

group :production, :staging do
  # Oracle DB
  gem 'activerecord-oracle_enhanced-adapter'
  gem 'ruby-oci8'
end

group :development, :production, :staging do
  gem 'rails_stdout_logging'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: :ruby
  gem 'pry'
  gem 'rb-readline'

  # Linters
  gem 'rubocop', '~> 0.36.0', require: false
  gem 'scss_lint', require: false
  gem 'jshint', platforms: :ruby

  # Security scanners
  gem 'brakeman'
  gem 'bundler-audit'

  # Testing tools
  gem 'rspec'
  gem 'rspec-rails'
  #gem 'guard-rspec', '4.7.1' # removed because downstream dep requires ruby 2.5
  gem 'capybara'
  gem 'sniffybara', git: 'https://github.com/department-of-veterans-affairs/sniffybara.git', branch: "master"
  gem 'simplecov', '0.12.0', require: false
  gem 'timecop'

  gem 'poltergeist' # For legacy JS tests. Remove when we're all React
  gem 'konacha'
  gem 'database_cleaner'
  gem 'parallel_tests'
  # to save and open specific page in capybara tests
  gem 'launchy'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0', platforms: :ruby
  gem 'foreman'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring', platforms: :ruby

  # Include the IANA Time Zone Database on Windows, where Windows doesn't ship with a timezone database.
  # POSIX systems should have this already, so we're not going to bring it in on other platforms
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
end
