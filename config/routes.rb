Rails.application.routes.draw do
  
    resources :home do
      
    end
    resources :curriculums do
      get :fetch_curriculums, on: :collection
    end
    resources :users do
      post :sign_in, on: :collection
      post :sign_up_from_android, on: :collection
      get :fetch_users_info, on: :collection
    end

    resources :curriculum_labels do
      get :fetch_curriculum_labels, on: :collection
    end
    
end
