Hcking::Application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :hate_tags, controller: :user_hate_tags
  end
  
  match 'tags/:tagname'  => 'tags#show'
  resources :tags
  
  resources :events do
    namespace "schedule" do
      resources :rdates, :exdates, :rules

      match 'update' => 'update#update', :via => :put
    end
     resources :single_events, :only => [:show, :update, :edit]
  end
  match 'ical' => "ical#index"

  root :to => 'welcome#index'

  match ':page_name' => 'pages#show'
  

end
