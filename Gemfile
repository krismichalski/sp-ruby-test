# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby "~> 2.6.5"

group :development, :test do
  gem "bundler-audit"
  gem "pry"
  gem "rspec", "~> 3.9"
  gem "rspec_junit_formatter"
  gem "rubocop"
  gem "rubocop-performance"
  gem "simplecov", require: false
end
