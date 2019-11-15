Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  get 'welcome/user_profile'
  post 'welcome/create_leave'
  post "update_leave" => "welcome#update_leave", as: "update_leave"
  get "change_leave_status" => "welcome#change_leave_status"
  get "/delete_leave/:id" => "welcome#delete_leave", as: 'delete_leave'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
