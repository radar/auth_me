get '/sign_up', to: 'sign_up#new'
post '/sign_up', to: 'sign_up#perform', as: :sign_up
get '/sign_in', to: 'sign_in#new'
post '/sign_in', to: 'sign_in#perform', as: :sign_in
