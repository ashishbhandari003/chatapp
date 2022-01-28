App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append(data['message'])

  speak: (data) ->
    @perform 'speak', message: data

$(document).on 'keypress', '#input', (event) ->
	if event.keyCode is 13
		userId = $('#userId').val()
		App.chatroom.speak [userId, event.target.value]
		event.target.value = ''

