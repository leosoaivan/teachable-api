source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Default gems
gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'rack-cors'

# Added gems
gem 'devise-jwt', '~> 0.7.0'
gem 'devise', '~> 4.7', '>= 4.7.2'
gem 'rubocop', '~> 0.86.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 5.2'
  gem 'faker', '~> 2.13'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers', '~> 4.3'
  gem 'simplecov', '0.17.1', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
