module Bot
  module DiscordCommands
    module Rand
      extend Discordrb::Commands::CommandContainer
      command(:rand, help_available: false) do |event, args|
        array = [":black_circle",":red_circle"]
        a1 = array.sample
        a2 = array.sample
        a3 = array.sample
        a4 = array.sample
        a5 = array.sample
        a6 = array.sample
        a7 = array.sample
        a8 = array.sample
        a9 = array.sample
        a10 = array.sample
        a11 = array.sample
        a12 = array.sample
        a13 = array.sample
        a14 = array.sample
        a15 = array.sample
        a16 = array.sample
        a17 = array.sample
        win = array.sample
        a0 = array.sample

    r = event.send "```#{a1}#{a2}#{a3}#{a4}#{a5}I#{a6}I#{a7}#{a8}#{a9}#{a10}#{a0}```"
    sleep(0.1)
            r.edit "```#{a2}#{a3}#{a4}#{a5}#{a6}I#{a7}I#{a8}#{a9}#{a10}#{a0}#{a11}```"
    sleep(0.1)
            r.edit "```#{a3}#{a4}#{a5}#{a6}#{a7}I#{a8}I#{a9}#{a10}#{a0}#{a11}#{a12}```"
    sleep(0.1)
            r.edit "```#{a4}#{a5}#{a6}#{a7}#{a8}I#{a9}I#{a10}#{a0}#{a11}#{a12}#{win}```"
    sleep(0.1)
            r.edit "```#{a5}#{a6}#{a7}#{a8}#{a9}I#{a10}I#{a0}#{a11}#{a12}#{win}#{a13}```"
    sleep(0.1)
            r.edit "```#{a6}#{a7}#{a8}#{a9}#{a10}I#{a0}I#{a11}#{a12}#{win}#{a13}#{a14}```"
    sleep(0.1)
            r.edit "```#{a7}#{a8}#{a9}#{a10}#{a0}I#{a11}I#{a12}#{win}#{a13}#{a14}#{a15}```"
    sleep(0.1)
            r.edit "```#{a8}#{a9}#{a10}#{a0}#{a11}I#{a12}I#{win}#{a13}#{a14}#{a15}#{a16}```"
    sleep(0.1)
            r.edit "```#{a9}#{a10}#{a0}#{a11}#{a12}I#{win}I#{a13}#{a14}#{a15}#{a16}#{a17}```"

if win == ":black_circle"
  wrenk = black
elsif win == "red_circle"
  wrenk = red
end
            if args == wrenk
              event.send "Kazandınız."
            else
              event.send "Kaybettiniz."
            end
      end
    end
  end
end
