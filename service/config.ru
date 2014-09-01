$:.unshift File.expand_path(File.dirname(__FILE__))

require 'bundler'

# require gemfile
Bundler.require(:default)

require 'linkedcare_cors'
require 'auth'
require 'app'

use Rack::Session::Cookie,
  :key => 'linkedcaresuperkey',
  :secret => 'linkedcaresupersecret'

use LinkedcareCors
run App