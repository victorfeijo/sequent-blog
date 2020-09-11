require './db/migrations'

Sequent.configure do |config|
  config.migrations_class_name = 'Migrations'

  config.command_handlers = [
    PostCommandHandler.new,
    AuthorCommandHandler.new
  ]

  config.event_handlers = [
    PostProjector.new,
    AuthorProjector.new
  ]
end
