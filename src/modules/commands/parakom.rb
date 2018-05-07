module Bot
  module DiscordCommands
    module Give
      extend Discordrb::Commands::CommandContainer
      $moneybucket = bucket :moneybucket, delay: 15
      command :give do |event, *args|
          bucketresponse = $moneybucket.rate_limited?(event.user)
          if bucketresponse
            event.send_temporary_message "#{event.user.username} oynamak için #{bucketresponse.round(2)} saniye bekleyiniz.\n**------------------------------**", 10.0
          else
        kisi = event.message.mentions[0]
        if args[1] == "<@#{event.message.mentions[0].id}>"
          event.send_temporary_message "#{event.user.username} doğru kullanım (*give @nick para)\n**------------------------------**", 20.0
        else
          if event.message.mentions.size > 1
            event.send_temporary_message "#{event.user.username} tek seferde bir kişiye para atabilirsiniz.(*give @nick para)\n**------------------------------**", 20.0
          elsif event.message.mentions.size == 1
            if event.message.mentions[0].id == event.user.id
              event.send_temporary_message "#{event.user.username} kendinize para gönderemezsiniz.\n**------------------------------**", 20.0
            else
              nick = event.user.username
              id = event.user.id
              user = User.find_by(user_id: id)
              user = User.create(user_id: id) if user.nil?
              if user.money < args[1].to_i
                event.send_temporary_message "#{event.user.username} yeterli paranız bulunmamaktadır. Paranız: #{user.money}\n**------------------------------**", 20.0
              else
                user.money -= args[1].to_i
                user.save
                alan = User.find_by(user_id: kisi.id)
                alan = User.create(user_id: kisi.id) if alan.nil?
                alan.money += args[1].to_i
                alan.save
                nil
                event.send "#{event.user.username} #{kisi.username}'e #{args[1]} gönderdi. Parası:#{user.money}\n**------------------------------**"
      end
         end
          elsif event.message.mentions.empty?
            event.send_temporary_message "Lütfen para atmak istediğiniz kişiyi etiketleyin.(*give @nick para)\n**------------------------------**", 20.0
end
           end
         end
           event.message.delete
      end
   end
    module Money
      extend Discordrb::Commands::CommandContainer
      command :money do |event|
        bucketresponse = $moneybucket.rate_limited?(event.user)
        if bucketresponse
          event.send_temporary_message "#{event.user.username} oynamak için #{bucketresponse.round(2)} saniye bekleyiniz.\n**------------------------------**", 10.0
        else
        nick = event.user.username
        id = event.user.id
        user = User.find_by(user_id: id)
        user = User.create(user_id: id) if user.nil?
        event.send_temporary_message "#{nick} paranız:#{user.money}\n**------------------------------**", 20.0
        nil
        end
          event.message.delete
      end
    end
    module Addmoney
      extend Discordrb::Commands::CommandContainer
      command(:addmoney, help_available: false) do |event, *args|
        sleep(0.5)
        event.message.delete
        break unless event.user.id == CONFIG.owner
        user = User.find_by(user_id: args[0].to_i)
        user = User.create(user_id: args[0].to_i) if user.nil?
        user.money += args[1].to_i
        user.save
        nil
      end
    end
    module Rmmoney
      extend Discordrb::Commands::CommandContainer
      command(:rmmoney, help_available: false) do |event, *args|
        sleep(0.5)
        event.message.delete
        break unless event.user.id == CONFIG.owner
        user = User.find_by(user_id: args[0].to_i)
        user = User.create(user_id: args[0].to_i) if user.nil?
        user.money -= args[1].to_i
        user.save
        nil
      end
    end
  end
end
