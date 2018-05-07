module Bot
  module DiscordCommands
    module Stats
      extend Discordrb::Commands::CommandContainer
      statbucket = bucket :statbucket, delay: 15
      command :stats do |event|
        if event.message.mentions.size == 1
          user = User.find_by(user_id: event.message.mentions[0].id)
          event.channel.send_embed do |embed|
            embed.colour = 0x8a1332
            embed.timestamp = Time.now
            embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: event.message.mentions[0].avatar_url)
            embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "Stats for #{event.message.mentions[0].username}", icon_url: event.message.mentions[0].avatar_url)
            embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'Xuu')
            xp = user.totalmoney
              -1.upto(30) do |level|
                check = xp - ((2**(level+1)) - 1) * 10000
                @rqexp = (-check).to_f
                break if check < 0
                @lvl = level +2
                @xp = check.to_f
              end
              percent = @xp / (@rqexp + @xp)
              dolu = (percent * 30).round
            levelbar = "**[#{'#' * dolu}#{'-' * (30-dolu)}]** -#{@rqexp.to_i}"
            embed.add_field(value: "Level: #{@lvl}",name: levelbar)
            embed.add_field(name: 'Money', value: user.money, inline: true)
            embed.add_field(name: 'Total money spent', value: user.totalmoney, inline: true)
          end
        elsif event.message.mentions.empty?
          user = User.find_by(user_id: event.user.id)
          event.channel.send_embed do |embed|
            embed.colour = 0x8a1332
            embed.timestamp = Time.now
            embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: event.user.avatar_url)
            embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "Stats for #{event.user.username}", icon_url: event.user.avatar_url)
            embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'Xuu')
            exp = user.totalmoney
              -1.upto(30) do |level|
                check = exp - ((2**(level+1)) - 1) * 10000
                @rqexp = (-check).to_f
                break if check < 0
                @lvl = level + 2
                @xp = check.to_f
              end
              percent = (@xp / (@rqexp + @xp))
              dolu = (percent * 30).round
            levelbar = "**[#{'#' * dolu}#{'-' * (30-dolu)}]** -#{@rqexp.to_i}"
            embed.add_field(value: "Level: #{@lvl}",name: levelbar)
            embed.add_field(name: 'Money', value: user.money, inline: true)
            embed.add_field(name: 'Total money spent', value: user.totalmoney, inline: true)
          end
        end
      end
    end
  end
end
