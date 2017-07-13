module Bot
  module DiscordCommands
    module Lolrundetay1
      extend Discordrb::Commands::CommandContainer
      command :lolrundetay1 do |event, args|
        puts "Lol komutu çalıştırıldı".colorize(:color => :red, :background => :white)
        nick = URI.escape(args)
        puts "Aranan sihirdar: #{nick}"
        url = 'https://tr1.api.riotgames.com/lol/summoner/v3/summoners/by-name/'+ nick +'?api_key=RGAPI-8a48e19f-b66c-4466-a858-e4ba98d37fa7'
        response = HTTParty.get(url)
        icerik = JSON.parse(response.body)
        ab12 = icerik["status"]
        if ab12 == {"message"=>"Data not found - summoner not found", "status_code"=>404}
        event.send "Böyle bir sihirdar bulunamadı."
        else
        id = icerik["id"]
        ids = id.to_s
        url1 = 'https://tr1.api.riotgames.com/lol/platform/v3/runes/by-summoner/'+ ids +'?api_key=RGAPI-8a48e19f-b66c-4466-a858-e4ba98d37fa7'
        response1 = HTTParty.get(url1)
        icerik1 = JSON.parse(response1.body)
        url2 = 'https://tr1.api.riotgames.com/lol/static-data/v3/runes?locale=tr_TR&tags=stats&api_key=RGAPI-4d3d1cff-4655-42d2-af90-fb3fb365f81e'
        response2 = HTTParty.get(url2)
        icerik2 = JSON.parse(response2.body)

        sayfa = icerik1["pages"]
        runadal1 = icerik2["data"]
        sayfa1 = sayfa[0]
        if sayfa1["slots"] == nil
          event.send "Rün sayfası Boş"
        else
        slot1 = sayfa1["slots"]
        cikti = []
        x = 0
              slot1.each do
               slotic = slot1[x]
               runid = slotic["runeId"]
               runidstr = runid.to_s
               runadalim = runadal1[runidstr]
               runad = runadalim["name"]
               cikti<< "#{slotic["runeSlotId"]}.Slot #{runad}"
               x += 1
             end
    end
        event.send "
        #{icerik["name"]} Adlı Sihirdarın #{sayfa1["name"]} Sayfası Rünleri:
        #{cikti[0]}
        #{cikti[1]}
        #{cikti[2]}
        #{cikti[3]}
        #{cikti[4]}
        #{cikti[5]}
        #{cikti[6]}
        #{cikti[7]}
        #{cikti[8]}
        #{cikti[9]}
        #{cikti[10]}
        #{cikti[11]}
        #{cikti[12]}
        #{cikti[13]}
        #{cikti[14]}
        #{cikti[15]}
        #{cikti[16]}
        #{cikti[17]}
        #{cikti[18]}
        #{cikti[19]}
        #{cikti[20]}
        #{cikti[21]}
        #{cikti[22]}
        #{cikti[23]}
        #{cikti[24]}
        #{cikti[25]}
        #{cikti[26]}
        #{cikti[27]}
        #{cikti[28]}
        #{cikti[29]}
        "
    end


  end
end
end
end
