$:.unshift File.expand_path(File.dirname(__FILE__))

require 'bundler'

# require gemfile
Bundler.require(:default)

require 'app'

use Rack::Session::Cookie,
  :key => 'linkedcaresuperkey',
  :secret => 'linkedcaresupersecret',
  :domain => '.corsauth.com',
  :expire_after => 2592000

run App