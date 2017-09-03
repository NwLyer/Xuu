# Osman Kaya - Discord Blackjack if enes yes scam
module Bot
  module DiscordCommands
    module Bjack
      extend Discordrb::Commands::CommandContainer
      $bjbucket = bucket :bj, delay: 5
      command :bjack do |event, args|
        bucketresponse = $bjbucket.rate_limited?(event.user)
         if bucketresponse
          event.send_temporary_message "**------------------------------**\n#{event.user.username} oynamak için #{bucketresponse.round(2)} saniye bekleyiniz.", 10.0
        else

        $players = $players.delete_if {|key, value|  Time.now > value['timeout'] }

        if args.nil?
          event.send_temporary_message "**------------------------------**\n#{event.user.username} bet miktarını giriniz.(*bjack bet)", 10.0
        elsif args.to_i >= 0 && args.to_i < 1000
          event.send_temporary_message "**------------------------------**\n#{event.user.username} en düşük bet miktarı 1000", 10.0
        else
          # v3 play2gather v4 update..
          nick = event.user.username
          idb = event.user.id
          bet = args
          user = User.find_by(user_id: idb)
          user = User.create(user_id: idb) if user.nil?

          if args.to_i > user.money
            event.send_temporary_message "**------------------------------**\n#{event.user.username} yeterli paranız bulunmamaktadır. Paranız: #{user.money}", 10.0
          else

            user.money -= args.to_i
            user.save
            event.send "**------------------------------**"
            fuk = 0
            dfuk = 0
            k = 0
            timeout = Time.now + 600
            kartlar = %w[1 2 3 4 5 6 7 8 9 X J Q K 1 2 3 4 5 6 7 8 9 X J Q K 1 2 3 4 5 6 7 8 9 X J Q K 1 2 3 4 5 6 7 8 9 X J Q K]
            b = kartlar.sample
            kartlar.delete_at(kartlar.find_index(b))
            i = kartlar.sample
            kartlar.delete_at(kartlar.find_index(i))
            u = kartlar.sample
            kartlar.delete_at(kartlar.find_index(u))
            d = kartlar.sample
            kartlar.delete_at(kartlar.find_index(d))

            if b == 'J' || b == 'Q' || b == 'K' || b == 'X'
              bt = 10
            elsif b == '1'
              bt = 11
              dfuk += 1
            else
              bt = b.to_i
            end
            if i == 'J' || i == 'Q' || i == 'K' || i == 'X'
              it = 10
            elsif i == '1'
              it = 11
              dfuk += 1
            else
              it = i.to_i
             end
            if u == 'J' || u == 'Q' || u == 'K' || u == 'X'
              ut = 10
            elsif u == '1'
              ut = 11
              fuk += 1
            else
              ut = u.to_i
            end
            if d == 'J' || d == 'Q' || d == 'K' || d == 'X'
              dt = 10
            elsif d == '1'
              dt = 11
              fuk += 1
            else
              dt = d.to_i
             end

            t1 = bt + it
            t2 = ut + dt
            t0 = bt

            if t2 > 21
              if fuk > 0
                t2 -= 10
                fuk -= 1
              elsif fuk == 0
                #gg
              end
              else
                #21 geçmedi devam aslan
              end

      m = event.send " ```
Dealer(#{t0})   #{nick[0..10]}(#{t2})
--------         --------
I #{b} --------     I #{u} --------
I   I######I     I   I #{d}    I
I   I######I     I   I      I
----I######I     ----I      I
    --------         --------
 Kart çekmek için *bcard
 Kalmak için *bdone
```"
            # bjack v3 - v4
            $players[idb.to_s] = Hash['message', m, 'nick', nick, 'idb', idb, 'bet', bet, 'fuk', fuk, 'dfuk', dfuk, 'k', k, 'kartlar', kartlar, 'b', b, 'i', i, 'u', u, 'd', d, 't1', t1, 't2', t2, 't0', t0, 'timeout', timeout]
            nil
          end
        end
      end
        event.message.delete
      end
end
    module Bcard
      extend Discordrb::Commands::CommandContainer
      command :bcard do |event|
        sleep(0.1)
          event.message.delete
        bucketresponse = $bjbucket.rate_limited?(event.user)
         if bucketresponse
          event.send_temporary_message "**------------------------------**\n#{event.user.username} oynamak için #{bucketresponse.round(2)} saniye bekleyiniz.", 10.0
        else

        if !$players.key?(event.user.id.to_s)
          event.send_temporary_message "**------------------------------**\n#{event.user.username} aktif oyununuz bulunmamaktadır. Yeni oyun başlatmak için (*bjack bet)", 10.0
        else
          # bjackv3
          idb = event.user.id.to_s
          nick = $players[idb]['nick']
          k = $players[idb]['k']
          b = $players[idb]['b']
          i = $players[idb]['i']
          u = $players[idb]['u']
          d = $players[idb]['d']
          kartlar = $players[idb]['kartlar']
          fuk = $players[idb]['fuk']
          dfuk = $players[idb]['dfuk']
          t0 = $players[idb]['t0']
          t1 = $players[idb]['t1']
          t2 = $players[idb]['t2']
          c1 = $players[idb]['c1']
          c2 = $players[idb]['c2']
          c3 = $players[idb]['c3']
          m = $players[idb]['message']

          k += 1
          if k == 1

            c1 = kartlar.sample
            kartlar.delete_at(kartlar.find_index(c1))

            if c1 == 'J' || c1 == 'Q' || c1 == 'K' || c1 == 'X'
              c1t = 10
            elsif c1 == '1'
              c1t = 11
              fuk += 1
            else
              c1t = c1.to_i
            end
            t2 += c1t

#2 kart gösterlmesi sorunu fix <3

            if t2 > 21
              if fuk > 0
                t2 -= 10
                fuk -= 1
              elsif fuk == 0
                #gg
              end
              else
                #21 geçmedi devam aslan
              end
              $players[idb] = $players[idb].merge(Hash['message', m, 'fuk', fuk, 'dfuk', dfuk, 'k', k, 'kartlar', kartlar, 't1', t1, 't2', t2, 't0', t0, 'c1', c1])
              nil

  m.edit " ```
DEALER(#{t0})      #{nick[0..10]}(#{t2})
--------            --------
I #{b} --------      I #{u} --------
I   I######I      I   I #{d}    I
I   I######I      I   I      I  --------
----I######I      ----I      I  I #{c1}    I
    --------          --------  I      I
                                I      I
                                --------
 ```"


            sleep(0.6)
m.edit " ```
Dealer(#{t0})    #{nick[0..10]}(#{t2})
--------          --------
I #{b} --------      I #{u} --------
I   I######I      I   I #{d}    I
I   I######I      I   I      --------
----I######I      ----I      I #{c1}    I
    --------          -------I      I
                             I      I
                             --------
```"
            sleep(0.6)


m.edit " ```
Dealer(#{t0})    #{nick[0..10]}(#{t2})
--------          --------
I #{b} --------      I #{u} --------
I   I######I      I   I #{d} --------
I   I######I      I   I   I #{c1}    I
----I######I      ----I   I      I
    --------          ----I      I
                          --------
```"
  elsif k == 2

            c2 = kartlar.sample
            kartlar.delete_at(kartlar.find_index(c2))

            if c2 == 'J' || c2 == 'Q' || c2 == 'K' || c2 == 'X'
              c2t = 10
            elsif c2 == '1'
              c2t = 11
              fuk += 1
            else
              c2t = c2.to_i
            end

            t2 += c2t

            if t2 > 21
              if fuk > 0
                t2 -= 10
                fuk -= 1
              elsif fuk == 0
                #gg
              end
              else
                #21 geçmedi devam aslan
              end
              $players[idb] = $players[idb].merge(Hash['message', m, 'fuk', fuk, 'dfuk', dfuk, 'k', k, 'kartlar', kartlar, 't1', t1, 't2', t2, 't0', t0, 'c2', c2])
              nil

m.edit " ```
Dealer(#{t0})    #{nick[0..10]}(#{t2})
--------          --------
I #{b} --------      I #{u} --------
I   I######I      I   I #{d} --------
I   I######I      I   I   I #{c1}    I
----I######I      ----I   I      I  --------
    --------          ----I      I  I #{c2}    I
                          --------  I      I
                                    I      I
                                    --------
```"
            sleep(0.5)
m.edit " ```
Dealer(#{t0})    #{nick[0..10]}(#{t2})
--------          --------
I #{b} --------      I #{u} --------
I   I######I      I   I #{d} --------
I   I######I      I   I   I #{c1}    I
----I######I      ----I   I      --------
    --------          ----I      I #{c2}    I
                          -------I      I
                                 I      I
                                 --------
```"
            sleep(0.5)

m.edit " ```
Dealer(#{t0})    #{nick[0..10]}(#{t2})
--------          --------
I #{b} --------      I #{u} --------
I   I######I      I   I #{d} --------
I   I######I      I   I   I #{c1} --------
----I######I      ----I   I   I #{c2}    I
    --------          ----I   I      I
                          ----I      I
                              --------
```"
          elsif k == 3

            c3 = kartlar.sample
            kartlar.delete_at(kartlar.find_index(c3))

            if c3 == 'J' || c3 == 'Q' || c3 == 'K' || c3 == 'X'
              c3t = 10
            elsif c3 == '1'
              c3t = 11
              fuk += 1
            else
              c3t = c3.to_i
            end
            t2 += c3t

            if t2 > 21
              if fuk > 0
                t2 -= 10
                fuk -= 1
              elsif fuk == 0
                #gg
              end
              else
                #21 geçmedi devam aslan
              end
              $players[idb] = $players[idb].merge(Hash['fuk', fuk, 'dfuk', dfuk, 'k', k, 'kartlar', kartlar, 't1', t1, 't2', t2, 't0', t0, 'c3', c3])
              nil

m.edit " ```
Dealer(#{t0})    #{nick[0..10]}(#{t2})
--------          --------
I #{b} --------      I #{u} --------
I   I######I      I   I #{d} --------
I   I######I      I   I   I #{c1} --------
----I######I      ----I   I   I #{c2}    I
    --------          ----I   I      I  --------
                          ----I      I  I #{c3}    I
                              --------  I      I
                                        I      I
                                        --------
```"

            sleep(0.5)
m.edit " ```
Dealer(#{t0})    #{nick[0..10]}(#{t2})
--------          --------
I #{b} --------      I #{u} --------
I   I######I      I   I #{d} --------
I   I######I      I   I   I #{c1} --------
----I######I      ----I   I   I #{c2}    I
    --------          ----I   I      --------
                          ----I      I #{c3}    I
                              -------I      I
                                     I      I
                                     --------
```"
            sleep(0.5)



m.edit " ```
Dealer(#{t0})    #{nick[0..10]}(#{t2})
--------          --------
I #{b} --------      I #{u} --------
I   I######I      I   I #{d} --------
I   I######I      I   I   I #{c1} --------
----I######I      ----I   I   I #{c2} --------
    --------          ----I   I   I #{c3}    I
                          ----I   I      I
                              ----I      I
                                  --------
```"
          else
            event.send_temporary_message "**------------------------------**\n#{nick} başka kart çekemezsiniz.", 20.0
         end
       end
        end
      end
    end
    module Bdone
      extend Discordrb::Commands::CommandContainer
      command :bdone do |event|
        sleep(0.1)
          event.message.delete
        bucketresponse = $bjbucket.rate_limited?(event.user)
         if bucketresponse
          event.send_temporary_message "**------------------------------**\n#{event.user.username} oynamak için #{bucketresponse.round(2)} saniye bekleyiniz.", 10.0
        else

        if !$players.key?(event.user.id.to_s)
          event.send_temporary_message "**------------------------------**\n#{event.user.username} aktif oyununuz bulunmamaktadır. Yeni oyun başlatmak için (*bjack bet)", 10.0
        else
          # bjackv3
          idb = event.user.id.to_s
          nick = $players[idb]['nick']
          k = $players[idb]['k']
          b = $players[idb]['b']
          i = $players[idb]['i']
          u = $players[idb]['u']
          d = $players[idb]['d']
          kartlar = $players[idb]['kartlar']
          fuk = $players[idb]['fuk']
          dfuk = $players[idb]['dfuk']
          t0 = $players[idb]['t0']
          t1 = $players[idb]['t1']
          t2 = $players[idb]['t2']
          c1 = $players[idb]['c1']
          c2 = $players[idb]['c2']
          c3 = $players[idb]['c3']
          bet = $players[idb]['bet']
          m = $players[idb]['message']

          t3 = t1
          kartlarc = []
          cekmesayisi = 0
          loop do
            break if t3 > t2
            break if t2 > 21
	    break if t3 == t2 && t3 > 16
            if t2 > 21
            else
              if t3 > t2

              else
                # kart cek
                cekmesayisi += 1
                dealc = kartlar.sample
                kartlar.delete_at(kartlar.find_index(dealc))

                if dealc == 'J' || dealc == 'Q' || dealc == 'K' || dealc == 'X'
                  dealct = 10
                elsif dealc == '1'
                  dealct = 11
                  dfuk += 1
                else
                  dealct = dealc.to_i
                end
                kartlarc << dealc

                t3 += dealct

                if t3 > 21
                  if dfuk > 0
                    t3 -= 10
                    dfuk -= 1
                  elsif dfuk == 0

                  end
                end
            end
          end
end
            case cekmesayisi
            when 0
              sira0 = "DEALER(#{t3})    "
              sira1 = '--------         '
              sira2 = "I #{b} --------     "
              sira3 = "I   I #{i}    I     "
              sira4 = 'I   I      I     '
              sira5 = '----I      I     '
              sira6 = '    --------     '
              sira7 = '                 '
              sira8 = '                 '
              sira9 = '                 '
            when 1
              sira0 = "DEALER(#{t3})        "
              sira1 = '--------             '
              sira2 = "I #{b} --------         "
              sira3 = "I   I #{i} --------     "
              sira4 = "I   I   I #{kartlarc[0]}    I     "
              sira5 = '----I   I      I     '
              sira6 = '    ----I      I     '
              sira7 = '        --------     '
              sira8 = '                     '
              sira9 = '                     '

            when 2
              sira0 = "DEALER(#{t3})              "
              sira1 = '--------                   '
              sira2 = "I #{b} --------               "
              sira3 = "I   I #{i} --------           "
              sira4 = "I   I   I #{kartlarc[0]} --------       "
              sira5 = "----I   I   I #{kartlarc[1]}    I       "
              sira6 = '    ----I   I      I       '
              sira7 = '        ----I      I       '
              sira8 = '            --------       '
              sira9 = '                           '

            when 3
              sira0 = "DEALER(#{t3})                "
              sira1 = '--------                   '
              sira2 = "I #{b} --------               "
              sira3 = "I   I #{i} --------           "
              sira4 = "I   I   I #{kartlarc[0]} --------       "
              sira5 = "----I   I   I #{kartlarc[1]} --------   "
              sira6 = "    ----I   I   I #{kartlarc[2]}    I   "
              sira7 = '        ----I   I      I     '
              sira8 = '            ----I      I     '
              sira9 = '                --------     '

            end

            if k == 0
  q =  " ```
#{sira0}#{nick[0..10]}(#{t2})
#{sira1}--------
#{sira2}I #{u} --------
#{sira3}I   I #{d}    I
#{sira4}I   I      I
#{sira5}----I      I
#{sira6}    --------
#{sira7}
#{sira8}
#{sira9}\n
```"

            elsif k == 1
  q =  " ```
#{sira0}#{nick[0..10]}(#{t2})
#{sira1}--------
#{sira2}I #{u} --------
#{sira3}I   I #{d} --------
#{sira4}I   I   I #{c1}    I
#{sira5}----I   I      I
#{sira6}    ----I      I
#{sira7}        --------
#{sira8}
#{sira9}\n
  ```"

            elsif k == 2
  q =  " ```
#{sira0}#{nick[0..10]}(#{t2})
#{sira1}--------
#{sira2}I #{u} --------
#{sira3}I   I #{d} --------
#{sira4}I   I   I #{c1} --------
#{sira5}----I   I   I #{c2}    I
#{sira6}    ----I   I      I
#{sira7}        ----I      I
#{sira8}            --------
#{sira9}\n
  ```"

            elsif k == 3
  q =  " ```
#{sira0}#{nick[0..10]}(#{t2})
#{sira1}--------
#{sira2}I #{u} --------
#{sira3}I   I #{d} --------
#{sira4}I   I   I #{c1} --------
#{sira5}----I   I   I #{c2} --------
#{sira6}    ----I   I   I #{c3}    I
#{sira7}        ----I   I      I
#{sira8}            ----I      I
#{sira9}                --------\n
  ```"

            end
            user = User.find_by(user_id: event.user.id)
            if t2 > t3 && t2 < 22 || t3 > 21
              user.money += (bet.to_i * 2)
              user.save

              q += "Tebrikler kazandınız.Paranız: #{user.money}"
              m.edit q
              $players.delete(idb)
	          elsif t2 == t3 && t2 < 22 && t3 < 22
              user.money += (bet.to_i)
              user.save

              q += "Berabere.Paranız: #{user.money}"
              m.edit q
              $players.delete(idb)
            else
              q += "Kaybettiniz.Paranız: #{user.money}"
              m.edit q
              $players.delete(idb)
            end
            nil
        end
      end
    end
end
end
end
