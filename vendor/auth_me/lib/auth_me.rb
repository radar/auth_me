require 'dry/transaction'

require 'auth_me/configuration'
require 'auth_me/entity'

require_relative '../apps/auth_me/application'

module AuthMe
  def self.configure(&block)
    self.configuration = Configuration.new.instance_eval(&block)
  end

  def self.configuration
    @@configuration
  end

  def self.configuration=(config)
    @@configuration = config
  end
end
