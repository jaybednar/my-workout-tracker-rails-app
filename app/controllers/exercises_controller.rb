class ExercisesController < ApplicationController
  before_action :find_exercise, only: [:show, :edit, :update, :destroy]


  def index
  end

  def show
  end

  def new
  end

  def create
    @workout = Workout.find(params[:exercise][:workout_id])
    @exercise = @workout.exercises.build(exercise_params)
    @exercise.save 
      
    redirect_to user_workout_path(@workout.user.id, @workout)
  end

  def edit
    if exercise_user? 
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
end
