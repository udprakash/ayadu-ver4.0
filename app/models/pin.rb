class Pin < ActiveRecord::Base

	 #using this http://stackoverflow.com/questions/7713695/how-to-modify-a-record-before-saving-on-ruby-on-rails
  #to prevent friendly id from becoming case insensitive sourcehttp://stackoverflow.com/questions/12673549/how-to-make-friendly-id-case-insensitive/12674241#12674241
  before_create :downcase_stuff


     belongs_to :user
     has_attached_file :image, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }

     def self.search(query)
# where(:title, query) -> This would return an exact match of the query
	where("title like ?", "%#{query}%") 
	end

     	validates :title, presence: true
		validates :description, presence: true
		validates :image, presence: true
		validates :daily, numericality: true
		validates :weekly, numericality: true
		validates :monthly, numericality: true
		
	private
    def downcase_stuff
      self.myfield.downcase!
     end	

end