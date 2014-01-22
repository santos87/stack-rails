NewStack::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  	# i want to add in all the REST urls for
  	# the stories
  	# e.g. index, show, new, create
  	# edit, update, destroy


	resources :stories do
		# this is called a nested resources
		#  basically meaning the urls for comments are on the
		# urls for stories
		resources :comments
		resources :votes
	end

	
	root "stories#index"
end
