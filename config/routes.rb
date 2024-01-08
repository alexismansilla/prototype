Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  scope :api do
    scope :v1 do
      resources :prototype, only: [:index]
    end
  end

  get :show, to: 'prototype#show'
  get :redirect_to_rr, to: 'prototype#redirect_to_rr'

  root to: "prototype#index"
end
