class NotificationMailer < ActionMailer::Base
    
  def publish_mail(content, email)
    @content = content
    mail(from: 'email@gmail.com', to: email,  subject: 'Notification from ChatRoom')
  end
end