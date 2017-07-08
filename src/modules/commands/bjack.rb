#Osman Kaya - Discord Blackjack
module Bot
  module DiscordCommands
    $tekkisi = 0
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
if $tekkisi == 0

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
else
event.send "Devam etmekte olan bir oyun var."
end

end
end
end
module Bcard
  extend Discordrb::Commands::CommandContainer
 command :bcard do |event|
if $tekkisi == 0
event.send "Yeni oyun başlatmak için *bjack"
else

if $nick != event.user.username
event.send "Şu anda #{$nick} oynuyor."
else
 $k += 1
 if $k == 1

$c1 = $kartlar.sample
$kartlar.delete_at($kartlar.find_index($c1))

if $c1 == "J"|| $c1 == "Q"|| $c1 == "K" || $c1 == "X"
$c1t = 10
elsif $c1 == "1"
$c1t = 11
$fuk += 1
else
$c1t = $c1.to_i
end

 n = event.send " ```
              #{$t0}                  #{$t2}
         --------            --------
         I #{$b}   --------      I #{$u}   --------~
DEALER   I     I######I      I     I #{$d}    I   #{$nick}
         I     I######I      I     I      I    --------
         ------I######I      ------I      I    I #{$c1}    I
               --------            --------    I      I
                                               I      I
                                               --------
```"
sleep(1)
n.edit " ```
             #{$t0}                 #{$t2}
         --------            --------
         I #{$b}   --------      I #{$u}   --------
DEALER   I     I######I      I     I #{$d}    I       #{$nick}
         I     I######I      I     I      I --------
         ------I######I      ------I      I I #{$c1}    I
               --------            -------- I      I
                                            I      I
                                            --------
```"
sleep(1)

$t2 += $c1t

if $t2 > 21
  if $fuk > 0
  $t2 -= 10
  $fuk -= 1

  n.edit  " ```
                  #{$t0}                  #{$t2}
             --------            --------
             I #{$b}   --------      I #{$u}   --------     #{$nick}
    DEALER   I     I######I      I     I #{$d}   --------
             I     I######I      I     I     I #{$c1}    I
             ------I######I      ------I     I      I
                   --------            ------I      I
                                             --------

  ```"

  elsif $fuk == 0
n.edit  " ```
                #{$t0}                  #{$t2}
           --------            --------
           I #{$b}   --------      I #{$u}   --------     #{$nick}
  DEALER   I     I######I      I     I #{$d}   --------
           I     I######I      I     I     I #{$c1}    I
           ------I######I      ------I     I      I
                 --------            ------I      I
                                           --------

```"
  end
else

n.edit " ```
              #{$t0}                  #{$t2}
         --------            --------
         I #{$b}   --------      I #{$u}   --------     #{$nick}
DEALER   I     I######I      I     I #{$d}   --------
         I     I######I      I     I     I #{$c1}    I
         ------I######I      ------I     I      I
               --------            ------I      I
                                         --------
Kart çekmek için *bcard
Kalmak için *bdone
```"

end


elsif $k == 2

$c2 = $kartlar.sample
$kartlar.delete_at($kartlar.find_index($c2))

if $c2 == "J"|| $c2 == "Q"|| $c2 == "K" || $c2 == "X"
  $c2t = 10
elsif $c2 == "1"
  $c2t = 11
  $fuk += 1
else
 $c2t = $c2.to_i
end

o = event.send " ```
              #{$t0}                  #{$t2}
         --------            --------
         I #{$b}   --------      I #{$u}   --------
DEALER   I     I######I      I     I #{$d}   --------     #{$nick}
         I     I######I      I     I     I #{$c1}    I
         ------I######I      ------I     I      I    --------
               --------            ------I      I    I #{$c2}    I
                                         --------    I      I
                                                     I      I
                                                     --------
```"
sleep(0.5)
o.edit " ```
              #{$t0}                  #{$t2}
         --------            --------
         I #{$b}   --------      I #{$u}   --------
DEALER   I     I######I      I     I #{$d}   --------     #{$nick}
         I     I######I      I     I     I #{$c1}    I
         ------I######I      ------I     I      I --------
               --------            ------I      I I #{$c2}    I
                                         -------- I      I
                                                  I      I
                                                  --------

```"
sleep(0.5)

$t2 += $c2t

if $t2 > 21
  if $fuk > 0
    $t2 -= 10
    $fuk -= 1

    o.edit " ```
                  #{$t0}                  #{$t2}
             --------            --------
             I #{$b}   --------      I #{$u}   --------
    DEALER   I     I######I      I     I #{$d}   --------     #{$nick}
             I     I######I      I     I     I #{$c1}   --------
             ------I######I      ------I     I     I #{$c2}    I
                   --------            ------I     I      I
                                             ------I      I
                                                   --------
    ```"

  elsif $fuk == 0

    o.edit " ```
                  #{$t0}                  #{$t2}
             --------            --------
             I #{$b}   --------      I #{$u}   --------
    DEALER   I     I######I      I     I #{$d}   --------     #{$nick}
             I     I######I      I     I     I #{$c1}   --------
             ------I######I      ------I     I     I #{$c2}    I
                   --------            ------I     I      I
                                             ------I      I
                                                   --------
    ```"
  end
else

  o.edit " ```
                #{$t0}                  #{$t2}
           --------            --------
           I #{$b}   --------      I #{$u}   --------
  DEALER   I     I######I      I     I #{$d}   --------     #{$nick}
           I     I######I      I     I     I #{$c1}   --------
           ------I######I      ------I     I     I #{$c2}    I
                 --------            ------I     I      I
                                           ------I      I
                                                 --------
Kart çekmek için *bcard
Kalmak için *bdone
 ```"

end

elsif $k == 3

$c3 = $kartlar.sample
$kartlar.delete_at($kartlar.find_index($c3))

if $c3 == "J"|| $c3 == "Q"|| $c3 == "K" || $c3 == "X"
  $c3t = 10
elsif $c3 == "1"
  $c3t = 11
  $fuk += 1
else
 $c3t = $c3.to_i
end

k = event.send " ```
              #{$t0}                  #{$t2}
         --------            --------
         I #{$b}   --------      I #{$u}   --------
DEALER   I     I######I      I     I #{$d}   --------     #{$nick}
         I     I######I      I     I     I #{$c1}   --------
         ------I######I      ------I     I     I #{$c2}    I
               --------            ------I     I      I    --------
                                         ------I      I    I #{$c3}    I
                                               --------    I      I
                                                           I      I
                                                           --------

```"

sleep(0.5)
k.edit " ```
              #{$t0}                  #{$t2}
         --------            --------
         I #{$b}   --------      I #{$u}   --------
DEALER   I     I######I      I     I #{$d}   --------     #{$nick}
         I     I######I      I     I     I #{$c1}   --------
         ------I######I      ------I     I     I #{$c2}    I
               --------            ------I     I      I --------
                                         ------I      I I #{$c3}    I
                                               -------- I      I
                                                        I      I
                                                        --------
```"
sleep(0.5)

$t2 += $c3t

if $t2 > 21
  if $fuk > 0
    $t2 -= 10
    $fuk -= 1

    k.edit " ```
                  #{$t0}                  #{$t2}
             --------            --------
             I #{$b}   --------      I #{$u}   --------
    DEALER   I     I######I      I     I #{$d}   --------     #{$nick}
             I     I######I      I     I     I #{$c1}   --------
             ------I######I      ------I     I     I #{$c2}   --------
                   --------            ------I     I     I #{$c3}    I
                                             ------I     I      I
                                                   ------I      I
                                                         --------
    ```"

  elsif $fuk == 0

    k.edit " ```
                  #{$t0}                  #{$t2}
             --------            --------
             I #{$b}   --------      I #{$u}   --------
    DEALER   I     I######I      I     I #{$d}   --------     #{$nick}
             I     I######I      I     I     I #{$c1}   --------
             ------I######I      ------I     I     I #{$c2}   --------
                   --------            ------I     I     I #{$c3}    I
                                             ------I     I      I
                                                   ------I      I
                                                         --------
    ```"
  end
else

  k.edit " ```
                #{$t0}                  #{$t2}
           --------            --------
           I #{$b}   --------      I #{$u}   --------
  DEALER   I     I######I      I     I #{$d}   --------     #{$nick}
           I     I######I      I     I     I #{$c1}   --------
           ------I######I      ------I     I     I #{$c2}   --------
                 --------            ------I     I     I #{$c3}    I
                                           ------I     I      I
                                                 ------I      I
                                                       --------
Kart çekmek için *bcard
Kalmak için *bdone
 ```"

end
else
  event.send "Başka kart çekemezsiniz."
end

end
end
end
end
$dfuk = 0
$cekmesayisi = 0
module Bdone
  extend Discordrb::Commands::CommandContainer
 command :bdone do |event|
$tekkisi = 0
   if $nick != event.user.username
   event.send "Şu anda #{$nick} oynuyor."
   else

 $t3 = $t1
$kartlarc = []

loop do
break if $t3 > $t2
break if $t2 > 21
  if $t2 > 21

break
  else
     if $t3 > $t2


     else
       #kart cek
       $cekmesayisi += 1
       dealc = $kartlar.sample
       $kartlar.delete_at($kartlar.find_index(dealc))

       if dealc == "J"|| dealc == "Q"|| dealc == "K" || dealc == "X"
          dealct = 10
       elsif dealc == "1"
         dealct = 11
         $dfuk += 1
       else
        dealct = dealc.to_i
       end
       $kartlarc<< dealc

       $t3 += dealct

        if $t3 > 21
            if $dfuk > 0
              $t3 -= 10
              $dfuk -= 1
            elsif $dfuk == 0


            end
        else
           #dur
        end
    end
  end
end

case $cekmesayisi
when 0
$sira1 = "             --------             "
$sira2 = "             I #{$b}   --------       "
$sira3 = "    DEALER   I     I #{$i}    I       "
$sira4 = "             I     I      I       "
$sira5 = "             ------I      I       "
$sira6 = "                   --------       "
$sira7 = "                                  "
$sira8 = "                                  "
$sira9 = "                                  "
  when 1
$sira1 = "             --------                   "
$sira2 = "             I #{$b}   --------             "
$sira3 = "    DEALER   I     I #{$i}   --------       "
$sira4 = "             I     I     I #{$kartlarc[0]}    I       "
$sira5 = "             ------I     I      I       "
$sira6 = "                   ------I      I       "
$sira7 = "                         --------       "
$sira8 = "                                        "
$sira9 = "                                        "

  when 2
    $sira1 = "             --------                                "
    $sira2 = "             I #{$b}   --------                          "
    $sira3 = "    DEALER   I     I #{$i}   --------                    "
    $sira4 = "             I     I     I #{$kartlarc[0]}   --------              "
    $sira5 = "             ------I     I     I #{$kartlarc[1]}    I              "
    $sira6 = "                   ------I     I      I              "
    $sira7 = "                         ------I      I              "
    $sira8 = "                               --------              "
    $sira9 = "                                                     "

  when 3
    $sira1 = "             --------                                "
    $sira2 = "             I #{$b}   --------                          "
    $sira3 = "    DEALER   I     I #{$i}   --------                    "
    $sira4 = "             I     I     I #{$kartlarc[0]}   --------              "
    $sira5 = "             ------I     I     I #{$kartlarc[1]}   --------         "
    $sira6 = "                   ------I     I     I #{$kartlarc[2]}    I         "
    $sira7 = "                         ------I     I      I         "
    $sira8 = "                               ------I      I         "
    $sira9 = "                                     --------                "

end

if $k == 0
   q = event.send " ```
                    #{$t3}                   #{$t2}
#{$sira1}--------
#{$sira2}I #{$u}   --------
#{$sira3}I     I #{$d}    I   #{$nick}
#{$sira4}I     I      I
#{$sira5}------I      I
#{$sira6}      --------
#{$sira7}
#{$sira8}
#{$sira9}
```"


elsif $k == 1
  q = event.send  " ```
                        #{$t3}                    #{$t2}
#{$sira1}--------
#{$sira2}I #{$u}   --------
#{$sira3}I     I #{$d}   --------     #{$nick}
#{$sira4}I     I     I #{$c1}    I
#{$sira5}------I     I      I
#{$sira6}      ------I      I
#{$sira7}            --------
#{$sira8}
#{$sira9}
  ```"

elsif $k == 2
  q = event.send " ```
                      #{$t3}                            #{$t2}
#{$sira1}--------
#{$sira2}I #{$u}   --------
#{$sira3}I     I #{$d}   --------     #{$nick}
#{$sira4}I     I     I #{$c1}   --------
#{$sira5}------I     I     I #{$c2}    I
#{$sira6}      ------I     I      I
#{$sira7}            ------I      I
#{$sira8}                  --------
#{$sira9}
  ```"

elsif $k == 3
  q = event.send " ```
                      #{$t3}                                 #{$t2}
#{$sira1}--------
#{$sira2}I #{$u}   --------
#{$sira3}I     I #{$d}   --------     #{$nick}
#{$sira4}I     I     I #{$c1}   --------
#{$sira5}------I     I     I #{$c2}   --------
#{$sira6}      ------I     I     I #{$c3}    I
#{$sira7}            ------I     I      I
#{$sira8}                  ------I      I
#{$sira9}                        --------
  ```"

end



if $t2 > $t3 && $t2 < 21 || $t3 > 21
  $paralar[$idb.to_s] += ($bet.to_i * 2)
  File.write('data/para.json', $paralar.to_json)

        w = event.send "Tebrikler kazandınız.Paranız: #{$paralar[$idb.to_s]}"

  else

      l = event.send "Kaybettiniz.Paranız: #{$paralar[$idb.to_s]}"
    end
        end
      end
    end
  end
end
