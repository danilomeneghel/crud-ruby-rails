class Employee < ApplicationRecord
	belongs_to :sector
	
	has_many :employee_skill
	has_many :skill, through: :employee_skill
	
	validates_presence_of :name
	
	def self.search(query)
		where(["name LIKE ?", "%#{query}%"])
	end
end
