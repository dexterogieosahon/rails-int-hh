 
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :authentication       => "plain",
  :enable_starttls_auto => true,
  :user_name            => "einsteinsa", #CONFIG[:smtp_username],
  :password             => "dega" #CONFIG[:smtp_password]
}

ActionMailer::Base.default_url_options[:host] = "localhost" # CONFIG[:host]
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
