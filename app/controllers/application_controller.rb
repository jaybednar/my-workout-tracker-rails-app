class ApplicationController < ActionController::Base
	include ApplicationHelper

	def authentication_required
		if !logged_in?
			flash[:message] = "You must be logged in to view that page."
			redirect_to root_path 
		end 
	end 

	def redirect_if_not_current_user 
		if !(current_user == User.find(params[:id]))
			flash[:message] = "You may not view another User's account."
			redirect_to user_path(current_user)
		end 
	end 

	def authorization_required
		if !(current_user == User.find(params[:user_id]))
			flash[:message] = "You may not view another User's account."
			redirect_to user_path(current_user)
		end 
	end 

	def no_route_redirect
		flash[:message] = "That page does not exist."
		redirect_to user_path(current_user)
	end 
	
end
