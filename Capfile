# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"
require "capistrano/rvm"
require "capistrano/bundler"
# require "capistrano/rails"
require 'capistrano/rails/assets'
require "capistrano/sidekiq"
require "capistrano3/unicorn"

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
