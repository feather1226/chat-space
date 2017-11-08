Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resouces :messages, only:[:index] do
  end
end
