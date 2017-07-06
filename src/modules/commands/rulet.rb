module Bot
  module DiscordCommands
    module Rand
      extend Discordrb::Commands::CommandContainer
      command(:rand, help_available: false) do |event|
        break unless event.user.id == CONFIG.owner
    r = event.send "Kartlar karıştırılıyor. Lütfen bekleyiniz."
    r.edit ":diamonds: :hearts: :spades: :clubs:"
    sleep(0.1)
    r.edit ":hearts: :spades: :clubs: :diamonds:"
    sleep(0.2)
    r.edit ":spades: :clubs: :diamonds: :hearts:"
    sleep(0.2)
    r.edit ":clubs: :diamonds: :hearts: :spades:"
    sleep(0.2)
    r.edit ":diamonds: :hearts: :spades: :clubs:"
      end
    end
  end
end
