@user = User.create(name: "Jay", email: "Jay@jay.com", password: "jjj")

@workout = @user.workouts.build(date: Date.today, bodypart: "Chest", weekday: "Tuesday", comments: "Feeling low-energy today but made it to the gym")


EXERCISES = [
	{name: "All", bodypart: "All"},
	{name: "Barbell Flat Bench Press", bodypart: "Chest"},
	{name: "DB Flat Bench Press", bodypart: "Chest"},
	{name: "Barbell Incline Bench Press", bodypart: "Chest"},
	{name: "DB Incline Bench Press ", bodypart: "Chest"},
	{name: "Barbell Decline Bench Press", bodypart: "Chest"},
	{name: "DB Decline Bench Press", bodypart: "Chest"},
	{name: "Incline Machine Press", bodypart: "Chest"},
	{name: "Neutral Machine Press", bodypart: "Chest"},
	{name: "Decline Machine Press", bodypart: "Chest"},
	{name: "Incline Neutral Machine Press", bodypart: "Chest"},
	{name: "Reverse Barbell Bench Press", bodypart: "Chest"},
	{name: "DB Incline Squeeze Press ", bodypart: "Chest"},
	{name: "DB Flyes", bodypart: "Chest"},
	{name: "Pec Dec ", bodypart: "Chest"},
	{name: "Cable Crossovers ", bodypart: "Chest"},
	{name: "Pullovers", bodypart: "Chest"},

	{name: "Barbell Military Press", bodypart: "Shoulders"},
	{name: "DB Military Press", bodypart: "Shoulders"},
	{name: "DB Lateral Raise", bodypart: "Shoulders"},
	{name: "Cable Lateral Raise ", bodypart: "Shoulders"},
	{name: "Barbell Front Raise ", bodypart: "Shoulders"},
	{name: "DB Front Raise ", bodypart: "Shoulders"},
	{name: "Cable Front Raise Bar", bodypart: "Shoulders"},
	{name: "Cable Front Raise Unilateral", bodypart: "Shoulders"},
	{name: "Arnold Press", bodypart: "Shoulders"},
	{name: "Convict Killers ", bodypart: "Shoulders"},
	{name: "Machine Press ", bodypart: "Shoulders"},
	{name: "Machine Laterals ", bodypart: "Shoulders"},
	{name: "Shrugs ", bodypart: "Shoulders"},
	{name: "FacePulls ", bodypart: "Shoulders"},
	{name: "Reverse Pec Dec ", bodypart: "Shoulders"},
	{name: "Reverse Cable Crossovers ", bodypart: "Shoulders"},
	
	{name: "Pulldowns (Wide, Under, Vbar, comfort, 1-arm)", bodypart: "Back"},
	{name: "Seated Rows (Under, Vbar,Comfort, Over, 1-arm)", bodypart: "Back"},
	{name: "DB Rows", bodypart: "Back"},
	{name: "Barbell Bent Over Rows(Over, Under)", bodypart: "Back"},
	{name: "Deadlift ", bodypart: "Back"},
	{name: "Rack Pulls ", bodypart: "Back"},
	{name: "Smith Rack Pulls ", bodypart: "Back"},
	{name: "Cobra Pulls (my mod smith rack pull)", bodypart: "Back"},
	{name: "Hyperextensions", bodypart: "Back"},
	{name: "Pullovers", bodypart: "Back"},
	{name: "T-Bar Rows", bodypart: "Back"},
	{name: "Chest Supported Row", bodypart: "Back"},
	{name: "Chest Supported Smith Row", bodypart: "Back"},
	{name: "Chest Supported Cable row ", bodypart: "Back"},
	{name: "Cable row(under) ", bodypart: "Back"},

	{name: "Barbell Curls", bodypart: "Arms"},
	{name: "DB Curls ", bodypart: "Arms"},
	{name: "Preacher Curls", bodypart: "Arms"},
	{name: "Reverse Curls ", bodypart: "Arms"},
	{name: "Hammer Curls ", bodypart: "Arms"},
	{name: "Cable Curls ", bodypart: "Arms"},
	{name: "Rope Cable Curls", bodypart: "Arms"},
	{name: "Pushdowns", bodypart: "Arms"},
	{name: "Overhead Extensions", bodypart: "Arms"},
	{name: "Skull Crushers", bodypart: "Arms"},
	{name: "Close Grip Bench Press", bodypart: "Arms"},
	{name: "Bench Dips", bodypart: "Arms"},

	{name: "Crunches", bodypart: "Abs"},
	{name: "Sit-ups", bodypart: "Abs"},
	{name: "Leg Raises", bodypart: "Abs"},
	{name: "Ab Rollouts", bodypart: "Abs"},

	{name: "Squat", bodypart: "Legs"},
	{name: "Leg Press", bodypart: "Legs"},
	{name: "Extensions", bodypart: "Legs"},
	{name: "Hack Squat", bodypart: "Legs"},
	{name: "Lunges", bodypart: "Legs"},
	{name: "Leg Curls ", bodypart: "Legs"},
	{name: "Stiff Leg Deadlift", bodypart: "Legs"},
	{name: "Standing Calf Raises", bodypart: "Legs"},
	{name: "Seated Calf Raises", bodypart: "Legs"}
]

EXERCISES.each do |ex_hash|
	ex = @workout.exercises.build(ex_hash)
end 

@workout.save

@user.save


