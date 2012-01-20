Rails.application.routes.draw do
  resources :attachments do
    collection do
      get :manage
    end
  end
end
