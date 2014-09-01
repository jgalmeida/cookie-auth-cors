class App < Sinatra::Base

  helpers  Sinatra::JSON
  register Sinatra::SessionAuth

  use Rack::Parser, :parsers => {
    'application/json' => Proc.new { |body| ::MultiJson.decode body }
  }

  disable :protection

  get '/' do
    "Waaaaaaarooooooooo! #{current_user}"
  end

  post '/engine' do
    authenticate!

    json [{ username: current_user }], status: 200
  end
end