module Bot
  module DiscordCommands
    module Lul
      extend Discordrb::Commands::CommandContainer
      command :lul do |event, args|
        puts "LUL komutu çalıştırıldı".colorize(:color => :red, :background => :white)
        nick = URI.escape(args)
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

        event.send "
        id = #{id}
        Tekli / Çiftli
        Tier: #{lulsolorank["tier"]}
        Rank: #{lulsolorank["rank"]}
        Esnek
        Tier: #{lulflexrank["tier"]}
        Rank: #{lulflexrank["rank"]}

        "
end
    end
  end
end
