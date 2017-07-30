=begin
module Bot
  module DiscordCommands
    module Lul
      extend Discordrb::Commands::CommandContainer
      command :lul do |event, *args|
        bosluksuz = args.join
        puts "LUL komutu çalıştırıldı".colorize(:color => :red, :background => :white)
        nick = URI.escape(bosluksuz)
        puts nick
        url = 'https://tr1.api.riotgames.com/lol/summoner/v3/summoners/by-name/'+ nick +'?api_key=RGAPI-91ac6004-d871-4053-ba34-456ea8b2c547'
        response = HTTParty.get(url)
        icerik = JSON.parse(response.body)
        id = icerik["id"]
        ids = id.to_s
        url1 = 'https://tr1.api.riotgames.com/lol/league/v3/positions/by-summoner/'+ ids +'?api_key=RGAPI-91ac6004-d871-4053-ba34-456ea8b2c547'
        response1 = HTTParty.get(url1)
        icerik1 = JSON.parse(response1.body)
        lulsolorank = icerik1[0]
        lulflexrank = icerik1[1]
        ehe = lulsolorank["miniSeries"]
        ehe1 = lulflexrank["miniSeries"]

        if ehe == nil
            ehee = "Seride değilsiniz."
        else
            ehee = "Seriler: Hedef #{ehe["target"]} Zafer #{ehe["wins"]} Bozgun #{ehe["losses"]}"
        end

        if ehe1 == nil
            ehee1 = "Seride değilsiniz."
        else
            ehee1 = "Seriler: Hedef #{ehe1["target"]} Zafer #{ehe1["wins"]} Bozgun #{ehe1["losses"]}"
        end

        event.send "
        id = #{id}
        Tekli / Çiftli
        Tier: #{lulsolorank["tier"]}
        Rank: #{lulsolorank["rank"]}
        #{ehee}
        Esnek
        Tier: #{lulflexrank["tier"]}
        Rank: #{lulflexrank["rank"]}
        #{ehee1}
        "
end
    end
  end
end
=end
