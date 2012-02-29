class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :image, :username
  authenticates_with_sorcery!
	
#Relations
	has_many :uploads
	has_many :posts, :dependent => :destroy
#	has_many :uploads, :through => :users_uploads


def feed
posts
end


#Validation
	 email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i	

  	validates_length_of 	:password, :within => 3..25, 
				:message => "password must be at least 3 and no more	 than 25 characters 						long", 
				:if => :password
  	validates_confirmation_of 	:password, 
					:message => "should match confirmation", 
					:if => :password
	validates		:email, 
				:presence => true,
				:format => { :with => email_regex },
				:uniqueness => { :case_sensetive => false }	
	validates 		:username,
				:presence => true,
				:length => { :maximum => 50 }

 	mount_uploader :image, ImageUploader
end
