  class UserMailer < ActionMailer::Base
    default :from => "rubyschoolsgroup@gmail.com"

    
    def welcome_email(user)
      @user = user
      mail(:to => user.email, :subject => "Welcome to MechMath_Social_Network!")
    end
  end
