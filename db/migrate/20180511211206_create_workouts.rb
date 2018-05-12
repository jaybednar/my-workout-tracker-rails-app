class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.datetime :date
      t.text :comments

      t.timestamps
    end
  end
end
