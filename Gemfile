source "https://rubygems.org"
ruby "2.6.5"

gem 'rake'
# let's use the latest and greatest
gem 'sequent', git: 'https://github.com/zilverline/sequent'

gem 'sinatra'
gem 'sinatra-flash'
gem 'sinatra-contrib'

group :test do
  gem 'rspec'
  gem 'database_cleaner'
end

group :development, :test do
  gem 'pry-meta'
end
