module Bot
  module DiscordCommands
    module Rulet
      extend Discordrb::Commands::CommandContainer
      ruletbucket = bucket :ruletbucket, delay: 35
      command :rulet do |event, *args|
        sleep(0.1)
        event.message.delete
          bucketresponse = ruletbucket.rate_limited?(event.user)
           if bucketresponse
            event.send_temporary_message "#{event.user.username} oynamak için #{bucketresponse.round(2)} saniye bekleyiniz.\n**------------------------------**", 10.0
          else

        user = User.find_by(user_id: event.user.id)
        user = User.create(user_id: event.user.id) if user.nil?
        if args[1] == nil
          event.send_temporary_message "#{event.user.username} bet miktarını giriniz.(*rulet red 1000)\n**------------------------------**", 20.0
        elsif args[1].to_i < 1000
          event.send_temporary_message "#{event.user.username} en düşük bet miktarı 1000\n**------------------------------**", 20.0
        else
    if args[0].downcase == "red" || args[0].downcase == "black" || args[0].downcase == "ruby"
          nickr = event.user.username
          id = event.user.id
          if args[1].to_i > user.money
            event.send_temporary_message "#{event.user.username} yeterli paranız bulunmamaktadır. Paranız: #{user.money}\n**------------------------------**", 20.0
          else
            if !$ruletplayers[event.server.id].nil?
              user.money -= args[1].to_i
              user.save
              $ruletplayers[event.server.id][event.user.id] = [args[0].downcase, args[1].to_i, event.user.username]
              case args[0].downcase
                when "black"
                  event.send_temporary_message "#{event.user.name} :black_circle: 'e #{args[1]} oynadı.\n**------------------------------**", 10.0
                when "red"
                  event.send_temporary_message "#{event.user.name} :red_circle: 'e #{args[1]} oynadı.\n**------------------------------**", 10.0
                when "ruby"
                  event.send_temporary_message "#{event.user.name} <:ruby:329628405056274442> 'e #{args[1]} oynadı.\n**------------------------------**", 10.0
                end
            else
              user.totalmoney += args[1].to_i
              user.money -= args[1].to_i
              user.save
              $ruletplayers[event.server.id] = {event.user.id => [args[0].downcase, args[1].to_i, event.user.username]}
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
            r = event.send "**[**#{a1}#{a2}#{a3}#{a4}#{a5}**I**#{a6}**I**#{a7}#{a8}#{a9}#{a10}#{a0}**]**  **Betler için 30sn**\n**------------------------------**"
            case args[0].downcase
              when "black"
                event.send_temporary_message "#{event.user.name} :black_circle: 'e #{args[1]} oynadı.\n**------------------------------**", 10.0
              when "red"
                event.send_temporary_message "#{event.user.name} :red_circle: 'e #{args[1]} oynadı.\n**------------------------------**", 10.0
              when "ruby"
                event.send_temporary_message "#{event.user.name} <:ruby:329628405056274442> 'e #{args[1]} oynadı.\n**------------------------------**", 10.0
              end
            sleep(10)
            r.edit "**[**#{a1}#{a2}#{a3}#{a4}#{a5}**I**#{a6}**I**#{a7}#{a8}#{a9}#{a10}#{a0}**]**  **Betler için 20sn**\n**------------------------------**"
            sleep(10)
            r.edit "**[**#{a1}#{a2}#{a3}#{a4}#{a5}**I**#{a6}**I**#{a7}#{a8}#{a9}#{a10}#{a0}**]**  **Betler için 10sn**\n**------------------------------**"
            sleep(10)
            r.edit "**[**#{a3}#{a4}#{a5}#{a6}#{a7}**I**#{a8}**I**#{a9}#{a10}#{a0}#{a11}#{a12}**]**\n**------------------------------**"
    sleep(0.5)
            r.edit "**[**#{a5}#{a6}#{a7}#{a8}#{a9}**I**#{a10}**I**#{a0}#{a11}#{a12}#{win}#{a13}**]**\n**------------------------------**"
    sleep(0.5)
            r.edit "**[**#{a7}#{a8}#{a9}#{a10}#{a0}**I**#{a11}**I**#{a12}#{win}#{a13}#{a14}#{a15}**]**\n**------------------------------**"
    sleep(0.5)
            r.edit "**[**#{a9}#{a10}#{a0}#{a11}#{a12}**I**#{win}**I**#{a13}#{a14}#{a15}#{a16}#{a17}**]**\n**------------------------------**"
    sleep(0.2)
            wintext = ""

        if win == ":black_circle:"
              wrenk = "black"
        elsif win == ":red_circle:"
             wrenk = "red"
           else
             wrenk = "ruby"
          end
          $ruletplayers[event.server.id].each do |idarr, arr|
            if arr[0] == wrenk
              arruser = User.find_by(user_id: idarr.to_i)
              if wrenk == "ruby"
                arruser.money += (arr[1] * 14)
                arruser.save
              else
                arruser.money += (arr[1] * 2)
                arruser.save
              end

              case arr[0]
                when "black"
                  wintext += "**#{arr[2]}** :black_circle: 'den #{arr[1] * 2} kazandı.\n**------------------------------**\n"
                when "red"
                  wintext += "**#{arr[2]}** :red_circle: 'den #{arr[1] * 2} kazandı.\n**------------------------------**\n"
                when "ruby"
                  wintext += "**#{arr[2]}** <:ruby:329628405056274442> 'den #{arr[1] * 14} kazandı.\n**------------------------------**\n"
                end

            else
              case arr[0]
                when "black"
                  wintext += "**#{arr[2]}** :black_circle: 'e #{arr[1]} kaybetti.\n**------------------------------**\n"
                when "red"
                  wintext += "**#{arr[2]}** :red_circle: 'e #{arr[1]} kaybetti.\n**------------------------------**\n"
                when "ruby"
                  wintext += "**#{arr[2]}** <:ruby:329628405056274442> 'e #{arr[1]} kaybetti.\n**------------------------------**\n"
                end
            end
          end
            event.send wintext
            nil
            $ruletplayers.delete(event.server.id)
            sleep(10)
            r.delete
            end # play2gather rulet v2
          end # para kont
else
  event.send_temporary_message "#{event.user.username} *rulet black bet, *rulet red bet, *rulet ruby bet komutlarını kullanınız.\n**------------------------------**", 20.0
end
end
end
      end
    end
  end
end
