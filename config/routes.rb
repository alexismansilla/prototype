Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  scope :api do
    scope :v1 do
      resources :prototype, only: [:index]
    end
  end
end
