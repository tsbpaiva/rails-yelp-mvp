Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  Rails.application.routes.draw do
    # meaning: from controller Restaurants, use those resources, but only those
    # specified in only (only carries names of methods defined on Controller)
    # index, show, new, edit, create, update, and destroy
    resources :restaurants, only: %i[index new create show destroy] do
      resources :reviews, only: %i[new create]
    end
    resources :reviews, only: :destroy
  end
end

# restaurants_path returns /restaurants
# new_restaurant_path returns /restaurants/new
# edit_restaurant_path(:id) returns /restaurants/:id/edit (for instance, edit_restaurant_path(10) returns /restaurants/10/edit)
# restaurant_path(:id) returns /restaurants/:id (for instance, restaurant_path(10) returns /restaurants/10)
