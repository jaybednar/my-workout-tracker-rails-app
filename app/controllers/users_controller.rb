class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required, except: [:new, :create]
  before_action :redirect_if_not_current_user, except: [:new, :create]

  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # confirm_password 
    if @user.save
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      render :new
    end  
  end 

  def edit
  end

  def update
    # confirm_password
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else 
      render :edit 
    end 
  end

  def destroy
    no_route_redirect
  end

  private 

    def user_params 
      params.require(:user).permit(:name, :email, :password, :password_confirmation, workouts_attributes: [:date, :weekday, :bodypart, :comments])
    end 

    def find_user 
      @user = User.find_by(id: params[:id])
    end 

    # def confirm_password
    #   if params[:user][:password] != params[:user][:password_confirmation]
    #     flash[:message] = "Passwords do not match."
    #   end
    # end  

 
end
