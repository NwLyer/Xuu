=begin
module Bot
  module DiscordCommands
    module IdSex
      extend Discordrb::Commands::CommandContainer
      command :odev do |event , args|
        url = 'https://tr1.api.riotgames.com/lol/summoner/v3/summoners/by-name/'+ args +'?api_key=RGAPI-ca0d4102-6d57-441d-88a3-652a45494c1d'
        response = HTTParty.get(url)
        body = JSON.parse(response.body)
        id = body["id"]
        ids = id.to_s

        event.send "
id = #{id}
Tekli/Çiftli
Tier = #{lul["tier"]}
Rank = #{lul["rank"]}
FLEX
Tier = #{lulflex["tier"]}
Rank = #{lulflex["rank"]}
        "
      end
      end
    end
  end
=end
