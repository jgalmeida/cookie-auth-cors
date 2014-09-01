class App < Sinatra::Base

  helpers  Sinatra::JSON
  register Sinatra::SessionAuth

  use Rack::Parser, :parsers => {
    'application/json' => Proc.new { |body| ::MultiJson.decode body }
  }

  disable :protection
end