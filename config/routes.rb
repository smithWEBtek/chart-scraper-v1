Rails.application.routes.draw do
	resources :genres, :albums, :tracks, :charts
	get '/', to: 'static#home'
 
end
