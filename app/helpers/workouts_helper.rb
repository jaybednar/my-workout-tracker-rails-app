module WorkoutsHelper

	def calc_weekday(day_num)
		case day_num 
		when 0
			"Sunday"
		when 1
			"Monday"
		when 2 
			"Tuesday"
		when 3 
			"Wednesday"
		when 4 
			"Thursday"
		when 5 
			"Friday"
		when 6
			"Saturday"
		end 
	end
	
end
