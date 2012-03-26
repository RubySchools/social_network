class Message < ActiveRecord::Base
#Relations
	belongs_to :user
	has_many :message_recipients
	has_many :recipients, :through => :message_recipients, :source => :user
#Validations
	validate :user_id, :presence => true

end
