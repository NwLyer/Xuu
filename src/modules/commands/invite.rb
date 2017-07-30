module Bot
  module DiscordCommands
    module Invite
      extend Discordrb::Commands::CommandContainer
      command :invite do |event|
        break unless event.user.id == CONFIG.owner
         event.bot.invite_url
      end
    end
  end
end
