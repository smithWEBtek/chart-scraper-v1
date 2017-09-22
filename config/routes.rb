Rails.application.routes.draw do

	resources :genres, :albums, :tracks, :charts, :songs, :categories
	get '/', to: 'static#home'
	get '/reset', to: 'static#reset'
	get '/scrape', to: 'static#scrape'
end
