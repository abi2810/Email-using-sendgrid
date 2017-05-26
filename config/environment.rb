# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'Username',
  :password => 'Password',
  :domain => 'your_domain',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}