class Upload < ActiveRecord::Base
        mount_uploader :file, FileUploader
	attr_accessible :name, :description, :file 
end
