class Upload < ActiveRecord::Base
        attr_accessible :name, :description, :file
	mount_uploader :file, FileUploader
end
