class EmployeeSkill < ApplicationRecord
  belongs_to :employee
  belongs_to :skill
end
