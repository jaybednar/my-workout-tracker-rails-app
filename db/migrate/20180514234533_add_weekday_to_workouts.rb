class AddWeekdayToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :weekday, :string
  end
end
