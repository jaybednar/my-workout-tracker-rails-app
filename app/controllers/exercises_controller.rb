class ExercisesController < ApplicationController
  before_action :find_exercise, only: [:show, :edit, :update, :destroy]


  def index
  end

  def show
  end

  def new
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

    def exercise_params 
      params.require(:exercise).permit(:name, :bodypart, :sets, :reps)
    end 

    def find_exercise 
      @exercise = exercise.find_by(id: params[:id])
    end 
end
