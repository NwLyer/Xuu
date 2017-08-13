module Bot
  module DiscordCommands
 module Give
      extend Discordrb::Commands::CommandContainer
bucket :moneybucket, limit: nil , time_span: nil , delay: 15
      command :give, bucket: :moneybucket, rate_limit_message: '%time% saniye daha bekleyiniz.' do |event, *args|
          kisi = event.message.mentions[0]
	if "<@#{event.message.mentions[0].id}>" == args[1]
	event.send "Doğru kullanım (*give @nick para)"
else
          if event.message.mentions.size > 1
              event.send "Tek seferde bir kişiye para atabilirsiniz.(*give @nick para)"
        elsif event.message.mentions.size == 1
	 if event.message.mentions[0].id == event.user.id
		event.send "Kendinize para gönderemezsiniz."
	else
        nick = event.user.username
        id = event.user.id
        dosya = File.read('data/para.json')
        paralar = JSON.parse(dosya)
        if paralar[id.to_s] < args[1].to_i
         event.send "Yeterli paranız bulunmamaktadır."
	else
          paralar[id.to_s] -= args[1].to_i
		if paralar[kisi.id.to_s].to_i == 0
		 paralar[kisi.id.to_s] = (100000 + args[1].to_i)
		else
		 paralar[kisi.id.to_s] += args[1].to_i
		end
          File.write('data/para.json', paralar.to_json)
        nil
        event.send "#{kisi.username}'e #{args[1]} gönderildi. Paranız:#{paralar[id.to_s]}"
end
end
	elsif event.message.mentions.size == 0
event.send "Lütfen para atmak istediğiniz kişiyi etiketleyin.(*give @nick para)"
end
     end
    end
end
    module Money
      extend Discordrb::Commands::CommandContainer
bucket :moneybucket, limit: nil , time_span: nil , delay: 15
      command :money, bucket: :moneybucket, rate_limit_message: '%time% saniye daha bekleyiniz.' do |event|
        nick = event.user.username
        id = event.user.id
        dosya = File.read('data/para.json')
        paralar = JSON.parse(dosya)
        if paralar[id.to_s] == nil
          paralar[id.to_s] = 100000
          File.write('data/para.json', paralar.to_json)
        end
        event.send "#{nick} paranız:#{paralar[id.to_s]}"
        nil
      end
    end
    module Addmoney
      extend Discordrb::Commands::CommandContainer
      command(:addmoney, help_available: false) do |event, *args|
        break unless event.user.id == CONFIG.owner
        dosya = File.read('data/para.json')
        paralar = JSON.parse(dosya)
        paralar[args[0].to_s] += args[1].to_i
        File.write('data/para.json', paralar.to_json)
        nil
      end
    end
    module Rmmoney
      extend Discordrb::Commands::CommandContainer
      command(:rmmoney, help_available: false) do |event, *args|
        break unless event.user.id == CONFIG.owner
        dosya = File.read('data/para.json')
        paralar = JSON.parse(dosya)
        paralar[args[0].to_s] -= args[1].to_i
        File.write('data/para.json', paralar.to_json)
        nil
      end
    end
    module Dbmoney
      extend Discordrb::Commands::CommandContainer
      command(:dbmoney, help_available: false) do |event|
        break unless event.user.id == CONFIG.owner
        dosya = File.read('data/para.json')
        event.send "#{dosya}"
        nil
      end
    end
  end
end
