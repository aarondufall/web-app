# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/', to: 'home#index', as: :home
get '/signup', to: 'user#new'
post '/signup', to: 'user#create', as: :signup

get '/signin', to: 'session#new', as: :signin
post '/signin', to: 'session#create', as: :signin
get '/signout', to: "session#destroy", as: :signout
