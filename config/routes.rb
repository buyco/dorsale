Dorsale::Engine.routes.draw do
  # Comments

  resources :comments, only: [:create, :edit, :update, :destroy]

  # Users

  resources :users, except: [:destroy]

  # Alexandrie / Attachments

  namespace :alexandrie do
    resources :attachments, only: [:index, :create, :edit, :update, :destroy]
  end
end
