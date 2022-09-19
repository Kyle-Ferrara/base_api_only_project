class WelcomeChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'welcome_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = data.fetch('message')

    # broadcast_to(
    #   self,
    #   action: 'newMessage',
    #   html: '<html></html>',
    #   author_id: 'blah'
    # )
    ActionCable.server.broadcast('welcome_channel', { body: 'world' })
  end
end
