class App < Sinatra::Base
  register Sinatra::AssetPack

  set :root,                    File.dirname(__FILE__)
  set :views,                   Proc.new { File.join(root, 'app/views') }
  set :public_folder,           Proc.new { File.join(root, 'public') }
  set :partial_template_engine, :erb

  disable :protection

  assets {
    serve '/js', from: 'app/js'

    js :application, '/js/application.js', ['/js/jquery.js']
  }

  get '/' do
    erb :home
  end
end