module Bot
  module DiscordCommands
    module Rulet
      extend Discordrb::Commands::CommandContainer
      command(:rulet) do |event, *args|
        dosya = File.read('data/para.json')
        paralarulet = JSON.parse(dosya)
        if args[1] == nil
          event.send "Bet miktarını giriniz.(*rulet red 10)"
        elsif 0 <= args[1].to_i && args[1].to_i < 1000
          event.send "En düşük bet miktarı 1000"
        else
    if args[0] == "red" || args[0] == "black" || args[0] == "ruby"
          nickr = event.user.username
          id = event.user.id
          if paralarulet[id.to_s] == nil
            paralarulet[id.to_s] = 100000
            File.write('data/para.json', paralarulet.to_json)
          end
          if args[1].to_i > paralarulet[id.to_s].to_i
            event.send "Yeterli paranız yok."
          else

          bet = args[1]
          paralarulet[id.to_s] -= args[1].to_i
          File.write('data/para.json', paralarulet.to_json)
        array = [":black_circle:",":red_circle:",":black_circle:",":red_circle:",":black_circle:",":red_circle:",":black_circle:",":red_circle:",":black_circle:",":red_circle:",":black_circle:",":red_circle:",":black_circle:",":red_circle:","<:ruby:329628405056274442>"]
a0 = array.sample
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
    r = event.send "**[**#{a1}#{a2}#{a3}#{a4}#{a5}**I**#{a6}**I**#{a7}#{a8}#{a9}#{a10}#{a0}**]** #{nickr}"
    sleep(0.5)
            r.edit "**[**#{a3}#{a4}#{a5}#{a6}#{a7}**I**#{a8}**I**#{a9}#{a10}#{a0}#{a11}#{a12}**]** #{nickr}"
    sleep(0.5)
            r.edit "**[**#{a5}#{a6}#{a7}#{a8}#{a9}**I**#{a10}**I**#{a0}#{a11}#{a12}#{win}#{a13}**]** #{nickr}"
    sleep(0.5)
            r.edit "**[**#{a7}#{a8}#{a9}#{a10}#{a0}**I**#{a11}**I**#{a12}#{win}#{a13}#{a14}#{a15}**]** #{nickr}"
    sleep(0.5)
            r.edit "**[**#{a9}#{a10}#{a0}#{a11}#{a12}**I**#{win}**I**#{a13}#{a14}#{a15}#{a16}#{a17}**]** #{nickr}"

        if win == ":black_circle:"
              wrenk = "black"
        elsif win == ":red_circle:"
             wrenk = "red"
           else
             wrenk = "ruby"
          end
            if args[0] == wrenk

              if wrenk == "ruby"
                dosya = File.read('data/para.json')
                paralarulet = JSON.parse(dosya)
                paralarulet[id.to_s] += (args[1].to_i * 14)
                File.write('data/para.json', paralarulet.to_json)
              else
                dosya = File.read('data/para.json')
                paralarulet = JSON.parse(dosya)
                paralarulet[id.to_s] += (args[1].to_i * 2)
                File.write('data/para.json', paralarulet.to_json)
              end
              r.edit "**[**#{a9}#{a10}#{a0}#{a11}#{a12}**I**#{win}**I**#{a13}#{a14}#{a15}#{a16}#{a17}**]** #{nickr} kazandınız.Paranız: #{paralarulet[id.to_s]}"
              nil
            else
              r.edit "**[**#{a9}#{a10}#{a0}#{a11}#{a12}**I**#{win}**I**#{a13}#{a14}#{a15}#{a16}#{a17}**]** #{nickr} kaybettiniz.Paranız: #{paralarulet[id.to_s]}"
              nil
            end

          end
else
  event.send "*rulet black bet, *rulet red bet, *rulet ruby bet komutlarını kullanınız."
end
end
      end
    end
  end
end
