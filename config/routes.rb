Rails.application.routes.draw do
  root  'chats#index'
  get '/chats' => 'chats#index'

end
