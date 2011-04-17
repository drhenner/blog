source 'http://rubygems.org'

gem 'rails', '3.0.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'bluecloth'
gem 'cancan',       '~> 1.4.1'
gem 'compass',      "~> 0.10.6"
gem "jquery-rails"
gem 'kaminari'
gem 'mysql2'

gem 'rails3-generators'
gem 'rakismet', '~> 1.0.1'
gem 'state_machine', '~> 0.10.3'
gem 'yajl-ruby'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

group :development, :test do
  gem 'rspec-rails'
  gem 'mocha', :require => false
  gem 'rspec-rails-mocha'

  gem "autotest"
  gem "autotest-rails-pure"

    if RUBY_PLATFORM =~ /darwin/
      gem "autotest-fsevent"
    end
  gem "autotest-growl"
  gem 'email_spec'
  gem 'factory_girl_rails', '~> 1.0.1'
  gem "nifty-generators", :git => 'git://github.com/drhenner/nifty-generators.git'
end
