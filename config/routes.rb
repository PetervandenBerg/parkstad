Parkstad::Application.routes.draw do

  get '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  
  resources :messages do
    resources :comments
  end
  
  resources :events do
    resources :attendances  
  end

  devise_for :users
  devise_for :admins

  get "pages/home"
 
  root 'pages#home'

end
