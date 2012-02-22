  require 'rubygems'
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.smtp_settings = 
{
  :user_name		=>  'rubyschoolsgroup@gmail.com',
  :password		=>  ';1fghtkz!',
  :domain		=>  'gmail.com',
  :address		=>  'smtp.gmail.com',
  :port			=>  587,
  :authentication	=>  'plain',
  :enable_starttls_auto =>  true
}

