class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if confirm_password 
        if @user.save
          redirect_to user_path(@user)
        else 
          render :new
        end 
    else 
      flash[:message] = "Passwords do not match."
      render :new
    end 
  end 

  def edit
  end

  def update
  end

  def destroy
  end

  private 

    def user_params 
      params.require(:user).permit(:name, :email, :password)
    end 

    def find_user 
      @user = User.find_by(id: params[:id])
    end 

    def confirm_password
      params[:user][:password] == params[:user][:password_confirmation]
    end 
end
