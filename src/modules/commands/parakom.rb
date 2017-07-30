module Bot
  module DiscordCommands
    module Money
      extend Discordrb::Commands::CommandContainer
      command(:money) do |event|
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
