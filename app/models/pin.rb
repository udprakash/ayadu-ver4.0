class Pin < ActiveRecord::Base
     belongs_to :user
     has_attached_file :image, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }

     	validates :title, presence: true
		validates :description, presence: true
		validates :image, presence: true
		validates :daily, numericality: true
		validates :weekly, numericality: true
		validates :monthly, numericality: true
		

end