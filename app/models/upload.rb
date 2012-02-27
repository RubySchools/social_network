class Upload < ActiveRecord::Base
        attr_accessible :name, :description, :file
	mount_uploader :file, FileUploader

#Relations
	belongs_to :user
	has_many :users_upload	
	has_many :savers, :through => :users_upload, :source => :user
 	
#Validation
end
