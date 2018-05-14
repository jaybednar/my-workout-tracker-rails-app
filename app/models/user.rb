class User < ApplicationRecord
	has_many :workouts
	has_many :exercises, through: :workouts

	has_secure_password

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true 

	accepts_nested_attributes_for :workouts

	def workouts_attributes=(workouts_attributes)
		self.workouts.create(workout_attributes)
		self.save
	end 

	def self.find_or_create_by_omniauth(auth)
		where(email: auth[:info][:email]).first_or_create do |user|
			user.name = auth[:info][:name]
			user.password = SecureRandom.hex
		end 
	end 

end
