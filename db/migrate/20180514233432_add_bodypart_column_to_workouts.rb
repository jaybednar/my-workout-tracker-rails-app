class AddBodypartColumnToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :bodypart, :string
  end
end
