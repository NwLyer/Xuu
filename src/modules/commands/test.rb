=begin
module Bot
  module DiscordCommands

    module Test
      extend Discordrb::Commands::CommandContainer
      command :test do |event|
      event.message.delete
      end
    end
  end
end
=end
