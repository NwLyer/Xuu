
module Bot
  module DiscordCommands

    module Test
      extend Discordrb::Commands::CommandContainer
      command :test do |event|
       event.message.delete
        $a = event.user.profile
        m = event.send "Hi! #{$a}"
      end
    end
  end
end
