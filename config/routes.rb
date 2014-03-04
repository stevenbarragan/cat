Cat::Application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'home#index'
  post 'next_move' => 'move#create'
end
