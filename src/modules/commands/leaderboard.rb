module Bot
  module DiscordCommands
    module Leaderboard
      extend Discordrb::Commands::CommandContainer
      lbucket = bucket :bj, delay: 20
      command :leaderboard do |event|
        bucketresponse = lbucket.rate_limited?(event.user)
        if bucketresponse
          event.send_temporary_message "#{event.user.username} oynamak için #{bucketresponse.round(2)} saniye bekleyiniz.", 10.0
        else
          allmembers = event.server.members.map!(&:id)
          leaders = User.where(user_id: allmembers).limit(10)
          ltext = "**------------------------------**\n**LEADERBOARD**\n"
          ott = 1
          leaders.each do |l|
            ltext += "**#{ott}.** `#{event.server.member(l.user_id).username}` **-** `#{l.money}`\n"
            ott += 1
          end
          event.send ltext
          nil
   end
     event.message.delete
      end
    end
  end
end
