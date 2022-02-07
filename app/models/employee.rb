class Employee < ApplicationRecord

  belongs_to :department

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable

  enum designation: {manager: 0, team_leader: 1, team_member: 2, staff: 3}

  mount_uploader :file, FileUploader

  # def soft_delete  
  #   update_attribute(:active, false)  
  # end  

  def active_for_authentication?
    super && self.active == true
  end

  def inactive_message
    "Sorry, this account has been deactivated."
  end

  # def inactive_message   
  #   !active ? super : :deleted_account  
  # end  
  

  def self.search(search)
    if search
      where("first_name iLIKE ?", "%#{search}%").order("first_name")
      # joins(:department).where("name iLIKE ?", "%#{search}%")
    else   
      all
    end
  end  

   
         
end
