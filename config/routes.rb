Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
   root to:'homes#top'
   resources :customers, only: [:index, :show]
   resources :item, only: [:show, :destroy]
   resources :genres, only: [:index, :edit, :create, :update]
    get 'genres/index'
  end

  scope module: :public do
   root to:'homes#top'
   get "/about" => "homes#about"
   resources :items, only: [:index, :show, :new, :edit, :create, :update, :destroy]
   resources :customers, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
