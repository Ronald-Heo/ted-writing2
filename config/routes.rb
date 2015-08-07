Rails.application.routes.draw do
  devise_for :users
 root :to => "bulletin#article"
 
 get ":controller(/:action(/:id))"
 post ":controller(/:action(/:id))"
 
end
