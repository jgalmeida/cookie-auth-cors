RailsFrontend::Application.routes.draw do
  root :to => 'application#index'

  post 'login' => 'application#login'
end
