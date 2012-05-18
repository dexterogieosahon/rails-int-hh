class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
   #default from: CONFIG[:from_email]

  def welcome_email(user)
    @user = user  
    attachments['books.png'] = File.read(Rails.root.join('app', 'assets', 'images', 'books.png'))
    mail(:to => "#{user.email}", :subject => "Welcome to Library")
  end
  
  def reservation_confirmation(user, book)
    @user = user
    @book = book
    mail(:to => "#{user.email}", :subject => "#{book.title} book reservation")
  end
end
