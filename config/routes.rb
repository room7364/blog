# Данный файл сопоставляет путь и контроллер
Rails.application.routes.draw do
  # This route declares that "GET /articles" requests are mapped to the "index" action of "ArticlesController"
  get "/articles", to: "articles#index"
  # Add a route that maps the root path of our application to the appropriate controller and action
  root "articles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
