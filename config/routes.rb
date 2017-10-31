Rails.application.routes.draw do
  get 'posts/new'

  get 'posts/create'

  get 'posts/edit'

  get 'posts/update'

  get 'posts/show'

  get 'posts/destroy'

  resources :sessions, only: [:new, :create, :edit]
  resources :user, only: [:new, :create] do
    resources :subs, only: [:edit]
    resources :posts, only: [:edit, :update]
  end
  resources :subs, except: [:edit, :destroy]
  resources :posts, except: [:edit, :update, :index]

end
