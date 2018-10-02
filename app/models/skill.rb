class Skill < ApplicationRecord
	has_many :employee_skill
	has_many :employee, through: :employee_skill
	
	def self.search(query)
		where(["name LIKE ?", "%#{query}%"])
	end
end
