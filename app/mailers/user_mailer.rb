  class UserMailer < ActionMailer::Base
    default :from => "rubyschoolsgroup@gmail.com"
    
    def welcome_email(user)
      mail(:to => user.email, :subject => "Welcome to Cathedra_Social_Network!")
    end
  end
