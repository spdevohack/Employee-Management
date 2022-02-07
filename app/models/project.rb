class Project < ApplicationRecord
	has_many :assignedproject, dependent: :destroy
  has_many :employees, through: :assignedproject
end
