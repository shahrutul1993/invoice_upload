Rails.application.routes.draw do
  # get 'invoices/index'
  # get 'vendors/index'

  root to: 'invoices#index'
  resources :invoices do
  	 collection { post :import }
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
