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
            xp = user.totalmoney
            -1.upto(30) do |level|
              check = xp - ((2**(level + 1)) - 1) * 10000
              break if check < 0
              @lvl = level + 2
            end
            user.money += 2500 * @lvl
            user.save
            end
          end
          sleep(600)
        end
      end
    end
  end
end
