module Bot
  module DiscordCommands
    module Servers
      extend Discordrb::Commands::CommandContainer
      command :servers do |event|
        BOT.servers.each {|a, b| event.send "#{b.name}"}
        nil
      end
    end
  end
end
