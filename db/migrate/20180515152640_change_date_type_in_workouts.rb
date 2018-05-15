class ChangeDateTypeInWorkouts < ActiveRecord::Migration[5.2]
  def change
  	change_column :workouts, :date, :date 
  end
end
