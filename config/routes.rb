Remetric::Engine.routes.draw do
  
  resources :events
  delete '/events' => 'events#destroy', as: :events_destroy
  get '/settings' => 'dashboard#settings', as: :settings
  
  delete '/:collection' => 'trackables#destroy', as: :trackables_destroy
  get '/:collection' => 'trackables#index', as: :trackables
  get '/:collection/:key' => 'trackables#show', as: :trackable
  
  root to: 'events#index'
end
