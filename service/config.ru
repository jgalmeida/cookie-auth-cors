$:.unshift File.expand_path(File.dirname(__FILE__))

require 'bundler'

# require gemfile
Bundler.require(:default)

require 'auth'
require 'app'

use Rack::Session::Cookie,
  :key => 'linkedcaresuperkey',
  :secret => 'linkedcaresupersecret'

use Rack::Cors do
  allow do
    origins 'http://corsauth.com:1337'
    resource '/engine', :headers => :any, :methods => :post, :credentials => true, :max_age => 1
  end
end

run App