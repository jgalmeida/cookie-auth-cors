class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    cookie = cookies.signed['railslinkedcaresuperkey']
    @current_username = cookie.nil? ? '' : cookie['current_user']

    render :home
  end

  def login
    @current_username = params[:username]
    value = { 'session_id' => SecureRandom.uuid, 'current_user' => params[:username] }

    cookies.signed['railslinkedcaresuperkey'] = { value: value, domain: '.corsauth.com' }

    render :home
  end

end
