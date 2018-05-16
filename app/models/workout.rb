class Workout < ApplicationRecord
	belongs_to :user 
	has_many :exercises
	

	accepts_nested_attributes_for :exercises 

	validates :date, presence: true 
	validates :weekday, presence: true 
	validates :bodypart, presence: true 

	def date_formatted
		self.date.strftime('%b %d, %Y')
	end 

end
