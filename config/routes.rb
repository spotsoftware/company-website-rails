CompanyWebsite::Application.routes.draw do

  # { Custom localized routes

  # :en

  match '/' => 'pages#main', via: :get, defaults: {id: 'main'}
  match '/about-us' => 'pages#about', via: :get, defaults: {id: 'about'}
  match '/our-solutions-and-services' => 'pages#services', via: :get, defaults: {id: 'services'}
  match '/contacts' => 'pages#contacts', via: :get, defaults: {id: 'contacts'}

  # :it

  match '/chi-siamo' => 'pages#about', via: :get, defaults: {id: 'about'}#, locale: :it}
  match '/le-nostre-soluzioni-i-nostri-servizi' => 'pages#services', via: :get, defaults: {id: 'services'}#, locale: :it}
  match '/contatti' => 'pages#contacts', via: :get, defaults: {id: 'contacts'}#, locale: :it}

  # }

  # { Errors routes

  get '404', to: 'errors#not_found'
  get '500', to: 'errors#server_error'
  get '422', to: 'errors#server_error'

  # }

  # Catch 404
  get '*path', to: 'errors#not_found'

end
