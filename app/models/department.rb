class Department < ApplicationRecord
	has_many :employees
	has_many :designations
	# def self.search(search)
 #    if search
 #      where("name iLIKE ?", "%#{search}%").order("name")
 #      # joins(:department).where("name iLIKE ?", "%#{search}%")
 #    else   
 #      all
 #    end
 #  end
end
