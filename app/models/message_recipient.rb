class MessageRecipient < ActiveRecord::Base
#Relations
	belongs_to :message
	belongs_to :user

#Validations
	validate :user_id, :presence => true
	validate :message_id , :presence => true

end
