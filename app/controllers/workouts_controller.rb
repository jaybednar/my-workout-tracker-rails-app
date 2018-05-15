class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @workouts = @user.workouts
  end

  def show
    @exercise = Exercise.new
  end

  def new
    @user = User.find(params[:user_id])
    @workout = @user.workouts.build
  end

  def create
    # raise params.inspect
    @user = User.find(params[:user_id])
    @workout = @user.workouts.build(workout_params)
    if @workout.save 
      redirect_to user_workout_path(@user, @workout)
    else 
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

    def workout_params 
      params.require(:workout).permit(:date, :weekday, :bodypart, :comments)
    end 

    def find_workout 
      @workout = Workout.find_by(id: params[:id])
    end 
end
