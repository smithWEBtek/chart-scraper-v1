Rails.application.routes.draw do
	resources :genres, :albums, :tracks, :charts
	get '/', to: 'static#home'
	get '/reset', to: 'static#reset'
	get '/scrape', to: 'static#scrape'
end
