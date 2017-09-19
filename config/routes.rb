Rails.application.routes.draw do
  get 'charts/index'

  get 'charts/show'

  get 'charts/new'

  get 'charts/create'

  get 'charts/edit'

  get 'charts/update'

  get 'charts/destroy'

  get 'tracks/index'

  get 'tracks/show'

  get 'tracks/new'

  get 'tracks/create'

  get 'tracks/edit'

  get 'tracks/update'

  get 'tracks/destroy'

  get 'albums/index'

  get 'albums/show'

  get 'albums/new'

  get 'albums/create'

  get 'albums/edit'

  get 'albums/update'

  get 'albums/destroy'

  # root 'static#home'
	get '/', to: 'static#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
