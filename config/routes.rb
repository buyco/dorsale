Dorsale::Engine.routes.draw do
  # Comments

  resources :comments, only: [:create, :edit, :update, :destroy]

  # Users

  resources :users, except: [:destroy]

  # Alexandrie / Attachments

  namespace :alexandrie do
    resources :attachments, only: [:index, :create, :edit, :update, :destroy]
  end

  # Expense Gun

  namespace :expense_gun do
    resources :categories, except: [:destroy, :show]

    resources :expenses, except: [:destroy] do
      member do
        get :copy
        patch :submit
        patch :accept
        patch :refuse
        patch :cancel
      end
    end

    get "/" => redirect{ ExpenseGun::Engine.routes.url_helpers.expenses_path }
  end

end
