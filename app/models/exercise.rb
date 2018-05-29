class Exercise < ApplicationRecord
	belongs_to :workout
  
  has_many :users, through: :workouts

  validates :name, presence: true
  validates :bodypart, presence: true


  def self.filter_by_bodypart(bodypart)
  	if bodypart == "All"
  		@exercises = Exercise.all.uniq 
  	else 
  		@exercises = self.where(bodypart: bodypart).uniq
  	end 
  end 

  def self.unique_bodyparts
    Exercise.select('DISTINCT bodypart')
  end

end
