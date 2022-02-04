class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable

  enum designation: {manager: 0, team_leader: 1, team_member: 2}
  enum department: {front_end: 0, back_end: 1, software_developer: 2, digital_marketing: 3}       
         
end
