module Bot
  module DiscordCommands
    module Invite
      extend Discordrb::Commands::CommandContainer
invite_bucket = bucket :invitebucket, limit: nil , time_span: nil , delay: 12
      command :invite, bucket: :invitebucket, rate_limit_message: '%time% saniye daha bekleyiniz.' do |event|
        bucketresponse = invite_bucket.rate_limited?(event.user)
         if bucketresponse
          event.send_temporary_message "#{event.user.username} invite linki için #{bucketresponse.round(2)} saniye bekleyiniz.\n**------------------------------**", 10.0
        else
         bot.invite_url 8192
end
      end
    end
  end
end
