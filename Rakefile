ENV['RACK_ENV'] ||= 'development'

require './sequent_blog'
require 'sequent/rake/migration_tasks'

Sequent::Rake::MigrationTasks.new.register_tasks!

task "sequent:migrate:init" => [:db_connect]

task "db_connect" do
  Sequent::Support::Database.connect!(ENV['RACK_ENV'])
end
