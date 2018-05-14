class SessionsController < ApplicationController
  def new
  	
  end

  def create
  	raise params.inspect
  	@user = User.find_by(email: params[:email])
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id 
  		redirect_to user_path(@user)
  	else
  		login_message
  		render :new  
  	end 
  end

  def destroy
  	session.delete(:user_id)
  	redirect_to root_path 
  end

  private 

  	def login_message 
  		if params[:email].present? && !@user
  			flash[:message] = "Email not found."
  		elsif params[:password].present? && !@user.authenticate(params[:password])
  			flash[:message] = "Email and password do not match."
  		else
  			flash[:message] = "Please fill out all fields."
  		end 
  	end 
end
