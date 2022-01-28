class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	data = data['message']
  	@user = User.find(data[0])
  	@user.messages.create(content: data[1])
  end
end
