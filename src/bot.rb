# Gems
require 'bundler/setup'
require 'discordrb'
require 'yaml'
require 'pg'
require 'active_record'

ActiveRecord::Base.establish_connection(
  'postgres://rlyxiyddgjgprw:7acbd7f955062ae90d55897f68ae03723e6d1f708f16e98455ccff7300d3d7fc@ec2-54-247-175-255.eu-west-1.compute.amazonaws.com:5432/d6f331pq16fvti'
)

ActiveRecord::Schema.define do

   end
class User < ActiveRecord::Base
  default_scope { order("money DESC") }
end
# The main bot module.
module Bot

  # bjack v4
  $players = {}
  $ruletplayers = {}
  # Load non-Discordrb modules
  Dir['src/modules/*.rb'].each { |mod| load mod }

  # Bot configuration
  CONFIG = OpenStruct.new YAML.load_file 'data/config.yaml'

  # Create the bot.
  # The bot is created as a constant, so that you
  # can access the cache anywhere.
  BOT = Discordrb::Commands::CommandBot.new(client_id: CONFIG.client_id,
                                            token: CONFIG.token,
                                            prefix: CONFIG.prefix)

  # Discord commands
  module DiscordCommands; end
  Dir['src/modules/commands/*.rb'].each { |mod| load mod }
  DiscordCommands.constants.each do |mod|
    BOT.include! DiscordCommands.const_get mod
  end

  # Discord events
  module DiscordEvents; end
  Dir['src/modules/events/*.rb'].each { |mod| load mod }
  DiscordEvents.constants.each do |mod|
    BOT.include! DiscordEvents.const_get mod
  end

  # Run the bot
  BOT.run
end
