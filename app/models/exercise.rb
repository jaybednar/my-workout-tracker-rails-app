class Exercise < ApplicationRecord
	belongs_to :workout
  
  has_many :users, through: :workouts


  def self.filter_by_bodypart(bodypart)
  	@exercises = self.where(bodypart: bodypart).uniq
  end 

end
