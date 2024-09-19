# Rails.application.routes.draw do
 # get "worker_events/index"
#   resources :events
#   resources :workers
#   root 'events#index'
# end


Rails.application.routes.draw do
  resources :events do
    collection do
      get :fetch_weather  # Ruta para obtener el clima
    end
  end
  
  resources :workers do
    resources :events, only: [:index], controller: 'worker_events' # Asegúrate de que sea este controlador
  end
  
  root 'events#index'
end

