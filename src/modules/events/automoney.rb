module Bot
  module DiscordEvents
    module Automoney
      extend Discordrb::EventContainer
      ready do |_event|
        loop do
          lul = []
          BOT.servers.each { |_a, b| b.online_users(include_idle: true, include_bots: false).each { |c| lul << c.id } }
          kisi = lul.uniq

          kisi.each do |id|
            user = User.find_by(user_id: id)
            if user.nil?
            else
            user.money += 2500
            user.save
            end
          end
          sleep(600)
        end
      end
    end
  end
end
