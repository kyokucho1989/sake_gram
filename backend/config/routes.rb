Rails.application.routes.draw do
  namespace :api, format: "json" do
    namespace :v1 do
      resources :results, only: %i[index show]
      resources :flavors, only: %i[index show]
      resources :sakedata, only: %i[index create show update destroy]
      resources :brands, only: %i[show]
      resources :breweries, only: %i[index show]
      resources :areas, only: %i[index show]
    end
  end
end
