class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
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
end
