# Require this file for unit tests
ENV['HANAMI_ENV'] ||= 'test'

require_relative 'dummy/config/environment'
require 'rspec'

Hanami.boot
