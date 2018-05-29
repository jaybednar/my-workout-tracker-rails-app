class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required
  before_action :authorization_required

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

    @user = User.find(params[:user_id])
    @workout = @user.workouts.build(workout_params)

    if @workout.save 
      @workout.exercises.destroy_all
      redirect_to user_workout_path(@user, @workout)
    else 
      render :new 
    end 
  end

  def edit
    @user = User.find(params[:user_id])
    @workout = @user.workouts.find(params[:id])
    if @workout
      render :edit
    else 
      flash[:message] = "You may only edit your workouts."
      redirect_to user_path(@user)
    end 
  end

  def update
    if @workout.update(workout_params)
      redirect_to user_workout_path(@workout.user, @workout)
    else 
      render :edit 
    end 
  end

  def destroy
    @user = current_user
    @workout = @user.workouts.find(params[:id])
    if @workout
      @workout.destroy
      @user.save
    else 
      flash[:message] = "You may only delete your workouts."
    end  
    redirect_to user_path(@user)
  end


 private 

    def workout_params 
      params.require(:workout).permit(:date, :weekday, :bodypart, :comments)
    end 

    def find_workout 
      @workout = Workout.find_by(id: params[:id])
    end 

    def workout_user?
      current_user == @workout.user
    end
end
