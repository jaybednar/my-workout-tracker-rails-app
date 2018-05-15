class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @workouts = @user.workouts
  end

  def show
    
  end

  def new
    @user = User.find(params[:user_id])
    @workout = @user.workouts.build
  end

  def create
    raise params.inspect
  end

  def edit
  end

  def update
  end

  def destroy
  end


 private 

    def workout_params 
      params.require(:workout).permit(:date, :comments)
    end 

    def find_workout 
      @workout = Workout.find_by(id: params[:id])
    end 
end
