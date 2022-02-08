class Employee < ApplicationRecord

  belongs_to :department
  has_many :attandences
  has_many :assignedproject, dependent: :destroy
  has_many :projects, through: :assignedproject

  devise :database_authenticatable,
         :recoverable, :rememberable

  enum designation: {manager: 0, team_leader: 1, team_member: 2, staff: 3}
  mount_uploader :file, FileUploader
 
  #validation for user

  validates :first_name, :last_name, :phone,  :address, :email, :gender, :designation, :salary, :password, presence: true
  validates :first_name, :last_name, length: { minimum: 3, too_short: true}, format: {with: /\A[A-Za-z]+\z/, message: "only letters are allowed"}
  validates :phone, length: {is: 10, message: "Only enter 10 digits" }, numericality: {message: "only numbers allowed"} 
  validates :address, length: {minimum: 15, message: "contains minimum 20 letters"}
  validates :salary, format: {with: /\A[0-9]+\z/, message: "only numbers are allowed"}
  # validates :email, uniqueness: {message: "has already been taken"}, format: {with: /\A[A-Za-z0-9]+(\.[A-Za-z0-9]+)?@[A-z]+\.(com|org|in)?\z/, message: "must match the pattern (xyz@gmail.com)"}
  validates :email, format: {with: /\A[A-Za-z0-9]+(\.[A-Za-z0-9]+)?@[A-z]+\.(com|org|in)?\z/, message: "must match the pattern (xyz@gmail.com)"}
  validates :encrypted_password, format: {with: /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}\z/, message: "Must contain Atleast one (A-Z), one(a-z), one special symbol(#$%^&@!$), one (0-9), minimum 6 characters " }

  def active_for_authentication?
    super && self.active == true
  end

  def inactive_message
    "Sorry, this account has been deactivated."
  end

  def full_name
    "#{first_name} #{last_name}"
  end 
  

  def self.search(search)
    if search
      where("first_name iLIKE ?", "%#{search}%").order("first_name")
      # joins(:department).where("name iLIKE ?", "%#{search}%")
    else   
      all.order(active: :desc)
    end
  end 

       
end
