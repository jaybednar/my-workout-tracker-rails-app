class Exercise < ApplicationRecord
	belongs_to :workout
  
  has_many :users, through: :workouts


  def self.filter_by_bodypart(bodypart)
  	if bodypart == "All"
  		@exercises = Exercise.all.uniq 
  	else 
  		@exercises = self.where(bodypart: bodypart).uniq
  	end 
  end 

  def self.unique_bodyparts
  	unique = []
  	self.all.each do |ex|
  		unique << ex unless unique.any?{|exercise| ex.bodypart == exercise.bodypart}
  	end 
  	unique 
  end

end
