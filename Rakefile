ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

ActiveRecord::Base.logger = Logger.new(STDOUT)

task :console do
  Pry.start
end
