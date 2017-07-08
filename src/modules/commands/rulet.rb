module Bot
  module DiscordCommands
    $tekrar = 0
    module Rulet
      extend Discordrb::Commands::CommandContainer
      command(:rulet) do |event, *args|
        $dosya = File.read('data/para.json')
        $paralar = JSON.parse($dosya)
        if args[1].to_i == nil
          event.send "Bet miktarını giriniz.(*rulet red 10)"
        elsif args[1].to_i < 10
          event.send "En düşük bet miktarı 10"
        else
    if args[0] == "red" || args[0] == "black" || args[0] == "ruby"
        if $tekrar == 0
          $nickr = event.user.username
          $id = event.user.id
          if $paralar[$id.to_s] == nil
            $paralar[$id.to_s] = 1000
            File.write('data/para.json', $paralar.to_json)
          end
          if args[1].to_i > $paralar[$id.to_s].to_i
            event.send "Yeterli paranız yok."
          else

          $tekrar = 1
          $bet = args[1]
          $paralar[$id.to_s] -= args[1].to_i
          File.write('data/para.json', $paralar.to_json)
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
    r = event.send "#{a1}#{a2}#{a3}#{a4}#{a5}I#{a6}I#{a7}#{a8}#{a9}#{a10}#{a0}"
    sleep(0.3)
            r.edit "#{a3}#{a4}#{a5}#{a6}#{a7}I#{a8}I#{a9}#{a10}#{a0}#{a11}#{a12}"
    sleep(0.3)
            r.edit "#{a5}#{a6}#{a7}#{a8}#{a9}I#{a10}I#{a0}#{a11}#{a12}#{win}#{a13}"
    sleep(0.3)
            r.edit "#{a7}#{a8}#{a9}#{a10}#{a0}I#{a11}I#{a12}#{win}#{a13}#{a14}#{a15}"
    sleep(0.3)
            r.edit "#{a9}#{a10}#{a0}#{a11}#{a12}I#{win}I#{a13}#{a14}#{a15}#{a16}#{a17}"

        if win == ":black_circle:"
              wrenk = "black"
        elsif win == ":red_circle:"
             wrenk = "red"
           else
             wrenk = "ruby"
          end
            if args[0] == wrenk

              if wrenk == "ruby"
                $paralar[$id.to_s] += (args[1].to_i * 14)
                File.write('data/para.json', $paralar.to_json)
              else
                $paralar[$id.to_s] += (args[1].to_i * 2)
                File.write('data/para.json', $paralar.to_json)
              end
              event.send "#{$nickr} kazandınız.Paranız: #{$paralar[$id.to_s]}"
              $tekrar = 0
              nil
            else
              event.send "#{$nickr} kaybettiniz.Paranız: #{$paralar[$id.to_s]}"
              $tekrar = 0
              nil
            end

          end
        else
            event.send "Devam etmekte olan bir oyun var."
      end
else
  event.send "*rulet black bet, *rulet red bet, *rulet ruby bet komutlarını kullanınız."
end
end
      end
    end
  end
end
