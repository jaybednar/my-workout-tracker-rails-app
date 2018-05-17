require 'rails_helper'

RSpec.describe Exercise, type: :model do

 before(:each) do 
 	Workout.destroy_all
 	@user = User.create(name: "Tester", email: "test@test.com", password: "test")
 	@workout = @user.workouts.build(date: Date.today, comments: "Great Workout!", weekday: "Thursday", bodypart: "Legs")
 end 

 it 'can create a new exercise' do 
 	@exercise = @workout.exercises.build(name: "Squat", bodypart: "Legs", sets: 3, reps: 10)
 	@exercise.save
 	expect(Exercise.all.count).to eq(1)
 	expect(Exercise.first.name).to eq("Squat")
 end 

 it 'validates for name' do 
 	@exercise = @workout.exercises.build(name: "", bodypart: "Legs", sets: 3, reps: 10)
 	@exercise.save
 	expect(Exercise.all.count).to eq(0)
 end 

 it 'validates for bodypart' do 
 	@exercise = @workout.exercises.build(name: "Squat", bodypart: "", sets: 3, reps: 10)
 	@exercise.save
 	expect(Exercise.all.count).to eq(0)
 end 

end
