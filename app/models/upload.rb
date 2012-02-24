class Upload < ActiveRecord::Base
        attr_accessible :name, :description, :file
	mount_uploader :file, FileUploader

#Relations
	belongs_to :user
#	has_many :users
#	has_many :users , :through => :users_uploads
	
#Validation
end
