class Sector < ApplicationRecord
	def self.search(query)
		where(["name LIKE ?", "%#{query}%"])
	end
end
