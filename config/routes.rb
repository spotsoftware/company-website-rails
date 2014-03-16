CompanyWebsite::Application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: redirect('/main')

  # This matches the other pages.
  # The parentheses mark the :format parameter of the route as optional, so /about or /about.html should work.
  # This needs to be at the bottom of the routes file, so that it won't interfere with your other routes.
  get '/:slug(.:format)', to: 'pages#show'

end
