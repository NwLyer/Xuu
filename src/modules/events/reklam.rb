module Bot
  module DiscordEvents
    # This event is processed each time the bot succesfully connects to discord.
    module Reklam
      extend Discordrb::EventContainer
      message(from: "NwLyer" , content:"reklam") do |event|
        channel = event.user.voice_channel
        server = event.user.server.id
        BOT.voice_connect(channel)
        sleep(0.5)
        event.voice.play_file('data/reklam.mp3')
        BOT.voice_destroy(channel.server.id)
    end
    end
  end
end
