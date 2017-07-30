require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'MzMxMTE4MTM0MTQyNTY2NDAy.DDq5Tg.pjOh7S95CCNoY0Bo7t_jjF741dw', client_id: 331118134142566402, prefix: '*'
bot.run
 bot.command :testt do |event, args|
   event.send "lul #{args}"
end
