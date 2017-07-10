module Bot
  module DiscordEvents
    module Ready
      extend Discordrb::EventContainer
      ready do |event|
        event.bot.game = CONFIG.game
      end
    end
  end
end
