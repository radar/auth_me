require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/auth_me_tests'
require_relative '../apps/web/application'

require 'auth_me'

Hanami.configure do
  mount AuthMe::Application, at: '/users'
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/auth_me_tests_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/auth_me_tests_development'
    #    adapter :sql, 'mysql://localhost/auth_me_tests_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/auth_me_tests/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :test do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []

    mailer do
      delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    end
  end
end
