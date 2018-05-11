class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :bodypart
      t.integer :reps
      t.integer :sets
      t.string :url

      t.timestamps
    end
  end
end
