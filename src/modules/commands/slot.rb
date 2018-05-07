module Bot
  module DiscordCommands
    module Slot
      extend Discordrb::Commands::CommandContainer
      command :slot do |event|
      slotbucket = bucket :slot, delay: 6
=begin
**.................................**
     **|**      **XuuLot**      **|**
     **------------------**        **o**
     **|** #{u1} #{u2} #{u3} **|**      ***|***
     **|** #{o1} #{o2} #{o3} **|** ***_*** ***|***
     **|** #{a1} #{a2} #{a3} **|**
     **------------------**
   **/ **                           **\**
  **|**                                **|**
  **|**                                **|**
  **|**                                **|**
=end
bucketresponse = slotbucket.rate_limited?(event.user)
 if bucketresponse
  event.send_temporary_message "#{event.user.username} oynamak için #{bucketresponse.round(2)} saniye bekleyiniz.\n**------------------------------**", 10.0
else
  idb = event.user.id
  user = User.find_by(user_id: idb)
  user = User.create(user_id: idb) if user.nil?
  if 1000 > user.money
    event.send_temporary_message "#{event.user.username} yeterli paranız bulunmamaktadır. Paranız: #{user.money}\n**------------------------------**", 10.0
  else
    user.totalmoney += 1000
    user.money -= 1000
    user.save
slot1 = ["<:ruby:329628405056274442>", ":8ball:", ":8ball:", ":8ball:", ":cherries:", ":cherries:", ":cherries:", ":cherries:", ":tangerine:", ":tangerine:", ":tangerine:", ":tangerine:", ":tangerine:", ":banana:", ":banana:", ":banana:", ":banana:", ":banana:", ":lemon:", ":lemon:", ":lemon:", ":lemon:", ":lemon:"]
slot2 = ["<:ruby:329628405056274442>", ":8ball:", ":lemon:", ":tangerine:", ":banana:", ":cherries:", ":cherries:", ":cherries:", ":tangerine:", ":tangerine:", ":tangerine:", ":tangerine:", ":tangerine:", ":banana:", ":banana:", ":banana:", ":banana:", ":banana:", ":lemon:", ":lemon:", ":lemon:", ":lemon:", ":lemon:"]
slot3 = ["<:ruby:329628405056274442>", ":8ball:", ":lemon:", ":tangerine:", ":banana:", ":cherries:", ":cherries:", ":cherries:", ":tangerine:", ":tangerine:", ":tangerine:", ":tangerine:", ":tangerine:", ":banana:", ":banana:", ":banana:", ":banana:", ":banana:", ":lemon:", ":lemon:", ":lemon:", ":lemon:", ":lemon:"]

u1 = slot1.sample
o1 = slot1.sample
a1 = slot1.sample

u2 = slot2.sample
o2 = slot2.sample
a2 = slot2.sample

u3 = slot3.sample
o3 = slot3.sample
a3 = slot3.sample

slot = event.send "
**................................**
    **|**      **XuuLot**      **|**
    **------------------**        **o**
    **|** #{u1} #{u2} #{u3} **|**      ***|***
    **|** #{o1} #{o2} #{o3} **|** ***_*** ***|***
    **|** #{a1} #{a2} #{a3} **|**
    **------------------**
  **|**                              **|**
  #{event.user.username}
  **|**                              **|**"

sleep(0.8)

slot.edit "
**................................**
    **|**      **XuuLot**      **|**
    **------------------**           **o**
    **|** #{u1} #{u2} #{u3} **|**        ***/***
    **|** #{o1} #{o2} #{o3} **|** ***_*** ***/***
    **|** #{a1} #{a2} #{a3} **|**
    **------------------**
  **|**                              **|**
  #{event.user.username}
  **|**                              **|**"

  sleep(0.8)

  a1 = u1
  a2 = u2
  a3 = u3

  u1 = slot1.sample
  o1 = slot1.sample

  u2 = slot2.sample
  o2 = slot2.sample

  u3 = slot3.sample
  o3 = slot3.sample

slot.edit "
**................................**
    **|**      **XuuLot**      **|**
    **------------------**        **o**
    **|** #{u1} #{u2} #{u3} **|**      ***|***
    **|** #{o1} #{o2} #{o3} **|** ***_*** ***|***
    **|** #{a1} #{a2} #{a3} **|**
    **------------------**
  **|**                              **|**
  #{event.user.username}
  **|**                              **|**"

  sleep(0.8)

  a2 = u2
  a3 = u3

  u2 = slot2.sample
  o2 = slot2.sample

  u3 = slot3.sample
  o3 = slot3.sample

slot.edit "
**................................**
    **|**      **XuuLot**      **|**
    **------------------**        **o**
    **|** #{u1} #{u2} #{u3} **|**      ***|***
    **|** #{o1} #{o2} #{o3} **|** ***_*** ***|***
    **|** #{a1} #{a2} #{a3} **|**
    **------------------**
  **|**                              **|**
  #{event.user.username}
  **|**                              **|**"

    sleep(0.8)

    a3 = u3

    u3 = slot3.sample
    o3 = slot3.sample

slot.edit "
**................................**
    **|**      **XuuLot**      **|**
    **------------------**        **o**
    **|** #{u1} #{u2} #{u3} **|**      ***|***
    **|** #{o1} #{o2} #{o3} **|** ***_*** ***|***
    **|** #{a1} #{a2} #{a3} **|**
    **------------------**
  **|**                              **|**
  #{event.user.username}
  **|**                              **|**"

win = [o1, o2, o3]
if win.count("<:ruby:329628405056274442>") == 3
  user.money += 60 * 1000
  user.save
  endgametext = "60000 Kazandınız.."
elsif win.count(":8ball:") == 3
  user.money += 40 * 1000
  user.save
  endgametext = "40000 Kazandınız.."
elsif win.count(":cherries:") == 3
  user.money += 20 * 1000
  user.save
  endgametext = "20000 Kazandınız.."
elsif win.count(":tangerine:") == 3 || win.count(":banana:") == 3 || win.count(":lemon:") == 3
  user.money += 10 * 1000
  user.save
  endgametext = "10000 Kazandınız.."
elsif win.count(":cherries:") == 2
  user.money += 4 * 1000
  user.save
endgametext = "4000 Kazandınız."
elsif win.count(":cherries:") == 1
  user.money += 1000
  user.save
endgametext = "1000 Kazandınız."
else
endgametext = "Kaybettiniz."
end

slot.edit "
**................................**
    **|**      **XuuLot**      **|**
    **------------------**        **o**
    **|** #{u1} #{u2} #{u3} **|**      ***|***
    **|** #{o1} #{o2} #{o3} **|** ***_*** ***|***
    **|** #{a1} #{a2} #{a3} **|**
    **------------------**
  **|**                              **|**
  #{event.user.username}
  #{endgametext}
  **|**                              **|**"
end #money
end #bucket
      end
    end
  end
end
