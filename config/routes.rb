Cat::Application.routes.draw do
  root 'home#index'
  post 'next_move' => 'move#create'
end
