Rails.application.routes.draw do
  root to: "fridge#index"
  get 'fridge/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
