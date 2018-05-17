class ApplicationController < ActionController::Base
	include ApplicationHelper

	def redirect_if_not_logged_in
		if !logged_in?
			flash[:message] = "You must be logged in to view that page."
			redirect_to root_path 
		end 
	end 


	
end
