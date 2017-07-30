class Owchamp
attr_reader :yencik, :yenilcik, :cikti1, :cikti2, :cikti3, :cikti4, :oyuntopcik, :olum, :eleme, :sonvur
def char(getchamp, bilgi, cesit)
  puts "owheroes çalıştı"
if getchamp == "widowmaker"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['venom_mine_kills_average']
    ozel2 = ortbilgi['scoped_critical_hits_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "tracer"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['pulse_bombs_attached_average']
    ozel2 = ortbilgi['pulse_bomb_kills_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "torbjorn"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['armor_packs_created_average']
    ozel2 = ortbilgi['turret_kills_average']
    ozel3 = ortbilgi['molten_core_kills_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "orisa"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['damage_amplified_average']
    ozel2 = ortbilgi['damage_blocked_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "dva"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['mechs_called_average']
    ozel2 = ortbilgi['self_destruct_kills_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "winston"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ['final_blows_average']
    ozel1 = ortbilgi['primal_rage_kills_average']
    ozel2 = ortbilgi['jump_pack_kills_average']
    ozel3 = ortbilgi['damage_blocked_average']
    ozel4 = ortbilgi['players_knocked_back_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "reinhardt"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['earthshatter_kills_average']
    ozel2 = ortbilgi['charge_kills_average']
    ozel3 = ortbilgi['damage_blocked_average']
    ozel4 = ortbilgi['fire_strike_kills_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "zenyatta"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['healing_done_average']
    ozel2 = ortbilgi['defensive_assists_average']
    ozel3 = ortbilgi['offensive_assists_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "genji"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['dragonblade_kills_average']
    ozel2 = ortbilgi['damage_reflected_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "bastion"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['healing_done_average']
    ozel2 = ortbilgi['tank_kills_average']
    ozel3 = ortbilgi['objective_kills_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "soldier76"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['healing_done_average']
    ozel2 = ortbilgi['tactical_visor_kills_average']
    ozel3 = ortbilgi['helix_rockets_kills_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "mei"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['healing_done_average']
    ozel2 = ortbilgi['blizzard_kills_average']
    ozel3 = ortbilgi['damage_blocked_average']
    ozel4 = ortbilgi['enemies_frozen_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "sombra"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['healing_done_average']
    ozel2 = ortbilgi['enemies_hacked_average']
    ozel3 = ortbilgi['enemies_empd_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "junkrat"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['rip_tire_kills_average']
    ozel2 = ortbilgi['enemies_trapped_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "ana"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['healing_done_average']
    ozel2 = ortbilgi['nano_boosts_applied_average']
    ozel3 = ortbilgi['enemies_slept_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "roadhog"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ['final_blows_average']
    ozel1 = ortbilgi['healing_done_average']
    ozel2 = ortbilgi['whole_hog_kills_average']
    ozel3 = ortbilgi['enemies_hooked_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "mercy"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['healing_done_average']
    ozel2 = ortbilgi['players_resurrected_average']
    ozel3 = ortbilgi['defensive_assists_average']
    ozel4 = ortbilgi['offensive_assists_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "reaper"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['healing_done_average']
    ozel2 = ortbilgi['death_blossom_kills_average']
    ozel3 = ortbilgi['souls_consumed_average']
    yen = genelbilgi['games_won']
    if cesit == "comp"
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "lucio"
  if bilgi == nil
    #evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    puts "bişeyler"
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['healing_done_average']
    ozel2 = ortbilgi['sound_barriers_provided_average']
    ozel3 = ortbilgi['defensive_assists_average']
    ozel4 = ortbilgi['offensive_assists_average']
    ozel1 = ozel1.round(0)
    ozel3 = ozel3.round(0)
    ozel4 = ozel4.round(0)
    yen = genelbilgi['games_won']
    yen = (yen).round(0)
    @olum = "Ölümler = #{ortolum}"
    @eleme = "Öldürmeler = #{orteleme}"
    @sonvur = "Son vuruşlar = #{ortsonvur}"
    @yencik = "Kazanılan oyunlar = #{yen}"
    @cikti1 = "Şifa = #{ozel1}"
    @cikti2 = "Sağlanan Sound Barrierler = #{ozel2}"
    @cikti3 = "Saldırı asistleri = #{ozel4}"
    @cikti4 = "Savunma asistleri = #{ozel3}"
    if cesit == "comp"
      yenil = genelbilgi['games_lost']
      yenil = (yenil).round(0)
      oyuntoplam = genelbilgi['games_played']
      oyuntoplam = oyuntoplam.round(0)
      @yenilcik = "Kaybedilen oyunlar = #{yenil}"
      @oyuntopcik = "Oynanan oyunlar = #{oyuntoplam}"
    else
      @yenilcik = ""
      @oyuntopcik = ""
    end
  end
elsif getchamp == "zarya"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['graviton_surge_kills_average']
    ozel2 = ortbilgi['damage_blocked_average']
    ozel3 = ortbilgi['projected_barriers_applied_average']
    ozel4 = ortbilgi['average_energy']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "hanzo"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['scatter_arrow_kills_average']
    ozel2 = ortbilgi['dragonstrike_kills_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "symmetra"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['sentry_turret_kills_average']
    ozel2 = ortbilgi['players_teleported_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "mccree"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['deadeye_kills_average']
    ozel2 = ortbilgi['fan_the_hammer_kills_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "pharah"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    ozel1 = ortbilgi['barrage_kills_average']
    ozel2 = ortbilgi['rocket_direct_hits_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
elsif getchamp == "doomfist"
  if bilgi == nil
    evemt.send "Bu karakter hakkında bilgiye ulaşılamadı."
  else
    ortbilgi = bilgi['average_stats']
    genelbilgi = bilgi['general_stats']
    orteleme = ortbilgi['eliminations_average']
    ortolum = ortbilgi ['deaths_average']
    ortsonvur = ortbilgi['final_blows_average']
    yen = genelbilgi['games_won']
    if cesit == comp
      yenil = genelbilgi['games_lost']
      oyuntoplam = genelbilgi['games_played']
    else
      yenil = ""
      oyuntoplam = ""
    end
  end
else
  #event.send "Böyle bir karakter bulunamadı."
end

end
end
