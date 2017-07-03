=begin
module Bot
  module DiscordEvents
    # This event is processed each time the bot succesfully connects to discord.
    module Reklam1
      extend Discordrb::EventContainer
      presence(from:"KodBilenAdam", status:"offline") do |event|
        event.send 'KodBilenAdam Ruby101 Dersleri İçin Tıkla.'
      end
  end
end
=end
