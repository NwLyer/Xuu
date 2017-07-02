module Bot
  module DiscordCommands
    module Hi
      extend Discordrb::Commands::CommandContainer
      command :hi do |event|
        m = event.send 'Hello'
      end
    end
  end
end
