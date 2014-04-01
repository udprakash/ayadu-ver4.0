class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins
  has_attached_file :avatar, :styles => { :medium => "300x300>", :middle => "200x200>", :thumb => "100x100>" }

  validates :firstname, presence: true, length: { maximum: 15 }
  validates :secondname, presence: true, length: { maximum: 15 }
  validates :phone, numericality: true
  validates :street, presence: true
  validates :locality, presence: true
  validates :city, presence: true
  
  validates :about, presence: true, length: { maximum: 500 }
  validates :avatar, presence: true
  
  validates :pincode, numericality: true
end
