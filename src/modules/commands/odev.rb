=begin
module Bot
  module DiscordCommands
    module IdSex
      extend Discordrb::Commands::CommandContainer
      command :odev do |event , args|
        if args == "kodbilenadam"
event.send "id = 323897
Tekli/Çiftli
Tier = Challanger
Rank = <:GivePLZ:330433357005717504> 1 <:TakeNRG:330433409325465601>
FLEX
Tier = OPUS
Rank = z64"
        else
        url = 'https://tr1.api.riotgames.com/lol/summoner/v3/summoners/by-name/'+ args +'?api_key=RGAPI-ca0d4102-6d57-441d-88a3-652a45494c1d'
        response = HTTParty.get(url)
        body = JSON.parse(response.body)
        id = body["id"]
        ids = id.to_s
        url1 = 'https://tr1.api.riotgames.com/lol/league/v3/positions/by-summoner/'+ ids +'?api_key=RGAPI-ca0d4102-6d57-441d-88a3-652a45494c1d'
        response1 = HTTParty.get(url1)
        body1 = JSON.parse(response1.body)
        lul = body1[0]
        lulflex = body1[1]

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
  end
=end
