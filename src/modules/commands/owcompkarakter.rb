module Bot
  module DiscordCommands
    module Owcompkarakter
      extend Discordrb::Commands::CommandContainer
      command :owcompkarakter do |event, args, gedit, getchamps|
        if gedit == nil || args == nil || getchamps == nil
          event.send "Kullanım şekli: ```&owcompkarakter (karakter) (battletag) (bölge)```"
        else
        puts "OW komutu çalıştırıldı".colorize(:color => :red, :background => :white)
        puts "Aranan Battletag #{args}"
        nick = args.sub('#', '-')
        url = 'https://owapi.net/api/v3/u/' +nick+ '/heroes'
        response = HTTParty.get(url)
        if response['error'] !=nil
          event.send "Böyle bir Battletag bulunamadı.(Battletagler harf büyüklüğüne duyarlıdır.)"
        else
        geditd = gedit.downcase
        bolge = response["#{geditd}"]
        if bolge == nil
          event.send "Bu Battletagin bu bölgeye kayıtlı bilgisi bulunmuyor."
        else
          cesit = "comp"
          icbilgi = bolge['heroes']
          istatistikler = icbilgi['stats']
          bilgiler = istatistikler['competitive']
          bilgi = bilgiler['getchamps']
          getchamp = getchamps.downcase
          bilgi = bilgiler["#{getchamp}"]
          getchampz = getchamps.capitalize
          puts getchampz
          require("./owheroes")
          nwlyerkalp = Owchamp.new
          nwlyerkalp.char(getchamp, bilgi, cesit)
          puts "bişeyler"
          event.channel.send_embed do |embed|
          embed.colour = 0xffae19
          embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: 'https://blzgdapipro-a.akamaihd.net/hero/' + getchamp + '/icon-portrait.png')
          embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "#{args} için Competitive #{getchampz} İstatistikleri", icon_url: "https://cdn.iconverticons.com/files/png/a12c1a69de0acc73_256x256.png")
          embed.add_field(name: "Genel istatistikler", value: "
#{nwlyerkalp.yencik}
#{nwlyerkalp.yenilcik}
#{nwlyerkalp.oyuntopcik} ", inline: true)
    embed.add_field(name: "Ortalamalar ", value: "
#{nwlyerkalp.eleme}
#{nwlyerkalp.sonvur}
#{nwlyerkalp.olum}
#{nwlyerkalp.cikti1}
#{nwlyerkalp.cikti2}
#{nwlyerkalp.cikti3}
#{nwlyerkalp.cikti4}
  ", inline: true)
        end
        end
      end
    end
    puts "Komut sonlandırıldı".colorize(:color => :blue, :background => :white)
  end
end
end
end
