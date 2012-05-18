# Load the rails application
require File.expand_path('../application', __FILE__)

#both ruby 1.9.1, 1.9.2 and 1.9.3 have vulnerabilities, assuming 1.9.3 is better
accepted_version = "1.9.3"
your_version = "#{RUBY_VERSION}"
if your_version < accepted_version
   abort <<-end_message
     Error has occured!. I refuse to run on Ruby version: #{your_version}. Get Ruby version: #{accepted_version} or later.
   end_message
end

# Initialize the rails application
Library::Application.initialize!
