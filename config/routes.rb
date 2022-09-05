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
   resources :customers, only: [:index, :show, :edit, :update]
   resources :items, only: [:show, :destroy] do
    resources :comments, only: [:destroy]
   end
   resources :genres, only: [:index, :edit, :create, :update]

   get 'genres/index'
   get "searches/index"
   get 'item_genres/index'
  end

  scope module: :public do
   root to:'homes#top'
   get "/about" => "homes#about"
   get 'homes/mypage'
   resources :items, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
   end
   resources :customers, only: [:index, :show, :edit, :update]
   get "searches/index"
   resources :item_genres, only: [:index]

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
