class UsersUpload < ActiveRecord::Base
#Relations
	belongs_to :user
	belongs_to :upload
#Validations
validates		:user_id, :presence => true	
validates		:upload_id, :presence => true
end
