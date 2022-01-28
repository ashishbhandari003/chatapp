class NotificationWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false, :queue => "default"

  def perform
    User.all.each do |user|
      content = ''
      today = Date.today
      latest_message_sent = user.messages.order(created_at: 'desc').first
      message_exchanged_in_last_week = Message.where(created_at: ((Date.today - 1.week)..today)).count
      content += "#{message_exchanged_in_last_week} messages have been exchanged in the last week. "
      if latest_message_sent
        message_exchanged_after_last_message = Message.where(created_at: (latest_message_sent.created_at..today)).count
        content += "#{message_exchanged_after_last_message} since your last message on the #{latest_message_sent.created_at.strftime('%d-%m-%Y')}."
      end
      NotificationMailer.publish_mail(content, user.email).deliver
    end
  end
end