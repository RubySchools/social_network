class Uploads < ActiveRecord::Base
        mount_uploader :file, FileUploader
end
