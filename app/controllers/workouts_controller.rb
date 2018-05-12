class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]

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

    def workout_params 
      params.require(:workout).permit(:date, :comments)
    end 

    def find_workout 
      @workout = workout.find_by(id: params[:id])
    end 
end
