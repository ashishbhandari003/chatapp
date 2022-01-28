class MessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chatroom_channel", message: render_message(message)
  end

  private

  def render_message(message)
  	ApplicationController.renderer.render(partial: 'messages/append_message', locals: {message: message})
  end
end
