class History < ActiveRecord::Base
	def self.search(search)
    if search
    	#find(:all, :conditions => ['ISBN LIKE ?', "%#{search}%"])
    self.where(["email like ? or name like ? or Description like ? or Title like ? or Status like ?", "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
  
  	else
    	self.all
    end
end

end
