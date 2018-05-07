module Bot
  module DiscordCommands
    module Servers
      extend Discordrb::Commands::CommandContainer
      command :servers do |event|
text = ""
        BOT.servers.each {|a, b| text += "#{b.name},"}
event.send text
        nil
      end
    end
  end
end
