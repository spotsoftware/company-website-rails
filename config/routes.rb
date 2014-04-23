CompanyWebsite::Application.routes.draw do

  # { Static pages

  resources :pages, only: [:show]

  # }

  # { Custom localized routes

  # :en

  match '/' => 'pages#showMain', via: :get, :defaults => {id: "main"}
  match '/about-us' => 'pages#showAbout', via: :get, defaults: {id: "about"}
  match '/our-solutions-and-services' => 'pages#showServices', via: :get, defaults: {id: "services"}
  match '/contacts' => 'pages#showContacts', via: :get, defaults: {:id => "contacts"}

  # :it

  match '/chi-siamo' => 'pages#showAbout', :via => :get , :defaults => {id: "about"}
  match '/le-nostre-soluzioni-i-nostri-servizi' => 'pages#showServices', via: :get, defaults: {id: "services"}
  match '/contatti' => 'pages#showContacts', via: :get, defaults: {id: "contacts"}

  # }

  # { Errors routes

  get '404', to: 'errors#not_found'
  get '500', to: 'errors#server_error'
  get '422', to: 'errors#server_error'

  # }

  # Catch 404
  get '*path', to: 'errors#not_found'

end
