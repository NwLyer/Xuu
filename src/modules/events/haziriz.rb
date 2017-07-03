=begin
module Bot
  module DiscordEvents
    # This event is processed each time the bot succesfully connects to discord.
    module Ready
      extend Discordrb::EventContainer
      message(from: "NwLyer" ,in:"#bottest") do |event|
        event.respond 'lul'
      end
    end
  end
end
=end
