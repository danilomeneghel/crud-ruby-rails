class Skill < ApplicationRecord
		
	validates_presence_of :name
	
	def self.search(query)
		where(["name LIKE ?", "%#{query}%"])
	end
end
