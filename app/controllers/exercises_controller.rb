class ExercisesController < ApplicationController
  before_action :find_exercise, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in

  def index
    if params[:exercise]
      @exercises = Exercise.filter_by_bodypart(params[:exercise][:bodypart]) 
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @exercises = @user.exercises 
    else
      @exercises = Exercise.all.uniq
    end 
  end

  def show
    no_route_redirect
  end

  def new
    @exercise ||= Exercise.new
    set_exercises
    @workout = Workout.find(params[:workout_id])
  end

  def create
    @workout = Workout.find(params[:exercise][:workout_id])
    @exercise = @workout.exercises.build(exercise_params)
    if @exercise.save
      @exercise = Exercise.new 
      redirect_to user_workout_path(@workout.user.id, @workout)
    else 
      render :new
    end 
  end

  def edit
    if exercise_user? 
      set_exercises
      render :edit 
    else 
      flash[:message] = "You may only edit your exercises."
      redirect_to user_path(current_user)
    end 
  end

  def update
  end

  def destroy
    @workout = @exercise.workout
    if exercise_user? 
      @exercise.destroy
      @workout.save 
      redirect_to user_workout_path(@workout.user, @workout)
    else 
      flash[:message] = "You may only delete your exercises."
      redirect_to user_path(current_user)
    end 
  end

  private 

    def exercise_params 
      params.require(:exercise).permit(:name, :bodypart, :sets, :reps)
    end 

    def find_exercise 
      @exercise = Exercise.find_by(id: params[:id])
    end 

    def exercise_user?
      current_user == @exercise.workout.user 
    end 

    def set_exercises 
      if params[:exercise]
        @exercises = Exercise.filter_by_bodypart(params[:exercise][:bodypart])
      else
        @exercises ||= Exercise.all
      end
    end 

end
