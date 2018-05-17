require 'rails_helper'

RSpec.describe Workout, type: :model do

 before(:each) do 
 	Workout.destroy_all
 	@user = User.create(name: "Tester", email: "test@test.com", password: "test")
 end 

 it 'can create a new workout' do 
 	@workout = @user.workouts.create(date: Date.today, comments: "Great Workout!", weekday: "Thursday", bodypart: "Legs")
 	expect(Workout.all.count).to eq(1)
 	expect(Workout.first.comments).to eq("Great Workout!")
 end

 it 'validates for date' do 
	@workout = @user.workouts.create(date: "", comments: "Great Workout!", weekday: "Thursday", bodypart: "Legs")
 	expect(Workout.all.count).to eq(0)
 end 

 it 'validates for weekday' do 
	@workout = @user.workouts.create(date: Date.today, comments: "Great Workout!", weekday: "", bodypart: "Legs")
 	expect(Workout.all.count).to eq(0)
 end 

 it 'validates for bodypart' do 
	@workout = @user.workouts.create(date: Date.today, comments: "Great Workout!", weekday: "Thursday", bodypart: "")
 	expect(Workout.all.count).to eq(0)
 end 

 it 'can add an exercise' do 
 	@workout = @user.workouts.build(date: Date.today, comments: "Great Workout!", weekday: "Thursday", bodypart: "Legs")
 	@exercise = @workout.exercises.build(name: "Squat", bodypart: "Legs", sets: 3, reps: 10)
 	@workout.save 

 	expect(@workout.exercises.count).to eq(1)
 	expect(@workout.exercises.first.name).to eq("Squat")
 end 

end
