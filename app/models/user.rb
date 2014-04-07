class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #using this http://stackoverflow.com/questions/7713695/how-to-modify-a-record-before-saving-on-ruby-on-rails
  #to prevent friendly id from becoming case insensitive sourcehttp://stackoverflow.com/questions/12673549/how-to-make-friendly-id-case-insensitive/12674241#12674241
  #before_create :downcase_stuff
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable




  has_many :pins
  has_many :orders

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

  #private
   # def downcase_stuff
    #  self.myfield.downcase!
     #end

end
