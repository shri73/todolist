Rails.application.routes.draw do
  resources :todos, defaults: {format: :json}
  get 'todos/by_finished/:finished',  to: 'todos#by_finished'

end
