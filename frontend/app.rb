class App < Sinatra::Base
  register Sinatra::AssetPack

  set :root,                    File.dirname(__FILE__)
  set :views,                   Proc.new { File.join(root, 'app/views') }
  set :public_folder,           Proc.new { File.join(root, 'public') }
  set :partial_template_engine, :erb

  disable :protection

  assets {
    serve '/js', from: 'app/js'

    js :application, ['/js/jquery.js']
  }

  get '/' do
    @current_username = session['current_user']
    erb :home
  end

  post '/login' do
    @current_username = params[:username]
    session['current_user'] = params[:username]

    erb :home
  end
end