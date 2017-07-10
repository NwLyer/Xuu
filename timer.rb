require 'discordrb'
bot = Discordrb::Commands::CommandBot.new token: 'MzMxMTE4MTM0MTQyNTY2NDAy.DDq5Tg.pjOh7S95CCNoY0Bo7t_jjF741dw', client_id: 331118134142566402, prefix: '*'

bot.command :timer do |event|
  loop do
  time = Time.now
  geri = 30 - time.min.to_i
  event.respond geri.to_s
  sleep(60)
end
end

bot.run
