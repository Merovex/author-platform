source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "nokogiri", "~> 1.13"
gem "mini_portile2", "~> 2.8"

gem "rails"
gem "rake"
gem "pkg-config"
# gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/latest/bin
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails", ">= 0.3.4"
gem 'turbo-rails', '~> 0.8'
gem "stimulus-rails", ">= 0.4.0"
gem "sprockets-rails", ">= 3.4.1"

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
# gem "tailwindcss-rails", ">= 0.4.3"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder", "~> 2.7"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.6.0', require: false

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Use Sass to process CSS
# gem "sassc-rails", "~> 2.1"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # Start debugger with binding.b [https://github.com/ruby/debug]
  gem "debug", ">= 1.0.0", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", ">= 4.1.0"
  gem "mailcatcher", "~> 0.2.4"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler", ">= 2.3.3"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end
# Application specific
gem 'devise', git: 'https://github.com/strobilomyces/devise', branch: 'patch-1'
gem "devise-passwordless"

gem "cancancan", "~> 3.3"
gem "geocoder", "~> 1.7"
gem "aws-sdk-locationservice", "~> 1.9"
gem "chartkick", "~> 4.0"
gem "groupdate", "~> 5.2"
gem "ahoy_matey", "~> 4.0"
gem "blazer", "~> 2.4"
gem "maxminddb", "~> 0.1.22"
gem "rolify", "~> 6.0"
gem "mini_magick", "~> 4.11"
gem "acts-as-taggable-on", "~> 5.0"
gem "color", "~> 1.8"
# gem "invisible_captcha", "~> 2.0"
gem "paper_trail", "~> 12.1"
gem "meta-tags", "~> 2.16"
gem "email_validator", "~> 2.2"


