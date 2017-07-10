#Osman Kaya - Discord Blackjack
module Bot
  module DiscordCommands
    $timeout = Time.new
    module Bjack
      extend Discordrb::Commands::CommandContainer
     command :bjack do |event, args|
    if args == nil
      event.send "Bet miktarını giriniz.(*bjack 10)"
elsif args.to_i < 10
  event.send "En düşük bet miktarı 10"
else
       if Time.now > $timeout
            $tekkisi = 0
       end

  $nick = event.user.username
  $idb = event.user.id
  $bet = args
  $dosya = File.read('data/para.json')
  $paralar = JSON.parse($dosya)

    if args[1].to_i > $paralar[$idb.to_s].to_i
      event.send "Yeterli paranız yok."
    else
      if $paralar[$idb.to_s] == nil
        $paralar[$idb.to_s] = (1000 - args.to_i)
        File.write('data/para.json', $paralar.to_json)
      else
        $paralar[$idb.to_s] -= args.to_i
        File.write('data/para.json', $paralar.to_json)
      end
     $fuk = 0
     $dfuk = 0
     $tekkisi = 1
     $k = 0
     $cekmesayisi = 0
     $timeout = Time.now + 30
   $kartlar = ["1","2","3","4","5","6","7","8","9","X","J","Q","K","1","2","3","4","5","6","7","8","9","X","J","Q","K","1","2","3","4","5","6","7","8","9","X","J","Q","K","1","2","3","4","5","6","7","8","9","X","J","Q","K"]
   $b = $kartlar.sample
    $kartlar.delete_at($kartlar.find_index($b))
   $i = $kartlar.sample
    $kartlar.delete_at($kartlar.find_index($i))
   $u = $kartlar.sample
    $kartlar.delete_at($kartlar.find_index($u))
   $d = $kartlar.sample
    $kartlar.delete_at($kartlar.find_index($d))

if $b == "J"|| $b == "Q"|| $b == "K" || $b == "X"
  bt = 10
elsif $b == "1"
  bt = 11
  $dfuk += 1
else
 bt = $b.to_i
end
 if $i == "J"|| $i == "Q"|| $i == "K" || $i == "X"
   it = 10
 elsif $i == "1"
   it = 11
   $dfuk += 1
 else
  it = $i.to_i
end
  if $u == "J"|| $u == "Q"|| $u == "K" || $u == "X"
    ut = 10
  elsif $u == "1"
    ut = 11
    $fuk += 1
  else
   ut = $u.to_i
end
   if $d == "J"|| $d == "Q"|| $d == "K" || $d == "X"
     dt = 10
   elsif $d == "1"
     dt = 11
     $fuk += 1
   else
    dt = $d.to_i
end

 $t1 = bt + it
 $t2 = ut + dt
 $t0 = bt

if $t2 > 21
  if $fuk > 0
    $t2 -= 10
    $fuk -= 1
  else

           m = event.send " ```
                     #{$t0}                #{$t2}
               --------            --------
               I #{$b}   --------      I #{$u}   --------
      DEALER   I     I######I      I     I #{$d}    I   #{$nick}
               I     I######I      I     I      I
               ------I######I      ------I      I
                     --------            --------

   ```"
  end
else

         m = event.send " ```
                   #{$t0}                #{$t2}
             --------            --------
             I #{$b}   --------      I #{$u}   --------
    DEALER   I     I######I      I     I #{$d}    I   #{$nick}
             I     I######I      I     I      I
             ------I######I      ------I      I
                   --------            --------
Kart çekmek için *bcard
Kalmak için *bdone
 ```"

end
end

end


end
end
  end
end
