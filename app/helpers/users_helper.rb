module UsersHelper

	def user_alert_class
		if @user.errors.any?
			'alert'
		end 
	end 

	def flash_alert_class
		if flash[:message]
			'alert'
		end 
	end 
	
end
