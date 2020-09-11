require 'yaml'
require 'erb'
require 'active_record'
require 'sequent'

class Database
  class << self
    def database_config(env = ENV['RACK_ENV'])
      @config ||= YAML.load(ERB.new(File.read('db/database.yml')).result)[env]
    end

    def establish_connection(env = ENV['RACK_ENV'])
      config = database_config(env)
      yield(config) if block_given?
      Sequent::ApplicationRecord.configurations[env.to_s] = config.stringify_keys
      Sequent::ApplicationRecord.establish_connection config
    end
  end
end
