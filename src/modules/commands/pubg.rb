=begin
module Bot
  module DiscordCommands
    module Pubg
      extend Discordrb::Commands::CommandContainer
      command(:pubg) do |event, args|
        require 'rest-client'
        url = 'https://pubgtracker.com/api/profile/pc/' + args.to_s
       response =  RestClient.get url, {'TRN-API-KEY':'3e631ef2-8c9b-4602-91a6-6e2d22ecb0c4'}
        event.send "#{response}"
      end
    end
  end
end
=end
