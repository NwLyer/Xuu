module Bot
  module DiscordEvents
    module Reklam1
      extend Discordrb::EventContainer
      presence(from:'KodBilenAdam' , status: :offline) do |event|
        BOT.send_message(331104630283042817,'KodBilenAdam Ruby101 Dersleri İçin Tıkla.')
end
end
module Reklam2
  extend Discordrb::EventContainer
  presence(from:'KodBilenAdam' , status: :online) do |event|
    BOT.send_message(331104630283042817,'Patron geldi reklam meklam yok.')
end
end
module Reklam3
  extend Discordrb::EventContainer
  presence(from:'NwLyer' , status: :online) do |event|
    BOT.send_message(331139916379586561,'Patron geldi reklam meklam yok.')
end
      end
  end
end
