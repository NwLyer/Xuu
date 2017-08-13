module Bot
  module DiscordCommands
    module Invite
      extend Discordrb::Commands::CommandContainer
bucket :invitebucket, limit: nil , time_span: nil , delay: 30
      command :invite, bucket: :invitebucket, rate_limit_message: '%time% saniye daha bekleyiniz.' do |event|
         event.bot.invite_url
      end
    end
  end
end
