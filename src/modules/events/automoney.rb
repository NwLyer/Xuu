module Bot
  module DiscordEvents
    module Automoney
      extend Discordrb::EventContainer
      ready do |event|
        loop do
          dosya = File.read('data/para.json')
          $paralarauto = JSON.parse(dosya)
          $lul = []
          BOT.servers.each {|a, b| b.online_users(include_idle: true, include_bots: false).each{|c| $lul<< c.id} }
          $kisisayisi = $lul.uniq.length
          $xauto = 0

            loop do
              dosya = File.read('data/para.json')
              $paralarauto = JSON.parse(dosya)
              break if $xauto > ($kisisayisi - 1)
              if $paralarauto[$lul.uniq[$xauto].to_s] == nil
                nil
              else
                  $paralarauto[$lul.uniq[$xauto].to_s] += 2500
                  File.write('data/para.json', $paralarauto.to_json)
              end
              $xauto += 1
            end
            sleep(600)
        end
      end
    end
  end
end
