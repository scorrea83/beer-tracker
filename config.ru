require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use StylesController
use ExperiencesController
use BeersController
use BreweriesController
use UsersController
run ApplicationController
