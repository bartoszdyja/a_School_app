Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'
  
  resources :students do
    get :subjects
  end

  resources :teachers do
    get :subjects
  end

  resources :subject_items

  resources :visitors, only: :index


  namespace :reports, as: 'report' do
   get :subjects
   get :payments
  end


end
