class Book < ActiveRecord::Base
	validates :ISBN, presence: true, uniqueness:true
    validates :title, presence: true
    validates :author, presence: true
    validates :description, presence: true
    belongs_to:user, :class_name => User, :foreign_key => "user_id"

	
def self.search(search)
    if search
    	#find(:all, :conditions => ['ISBN LIKE ?', "%#{search}%"])
    self.where(["Author like ? or Description like ? or Title like ? or Status like ?", "%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
  
  	else
    	self.all
    end
end
end
