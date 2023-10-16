require 'bundler'
Bundler.require

require_relative 'lib/player'

puts "---------------------------------------------------"
puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
puts "---------------------------------------------------"

puts "Rentre ton nickname"
print ">>>"
name_of_real_player = gets.chomp

real_player = HumanPlayer.new(name_of_real_player)

player1 = Player.new("Josiane")
player2 = Player.new("José")

while real_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts "\nVoici l'état de nos joueurs :"
    real_player.show_state
    player1.show_state
    player2.show_state
  
    puts "\nQuelle action veux-tu effectuer ?"
    puts "a - Chercher une meilleure arme"
    puts "s - Chercher à se soigner"
    puts "attaquer un joueur en vue :"
    if player1.life_points > 0
        puts "0 - Josiane a #{player1.life_points} points de vie"
    end

    if player2.life_points > 0
        puts "1 - José a #{player2.life_points} points de vie"
    end

    print ">>>"
    choice = gets.chomp
  
    case choice
    when "a"
      real_player.search_weapon
    when "s"
      real_player.search_health_pack
    when "0"
      if player1.life_points > 0
          real_player.attacks(player1)
      else
          puts "Josiane a déjà été éliminée."
      end
    when "1"
      if player2.life_points > 0
        real_player.attacks(player2)
      else
        puts "José a déjà été éliminé."
      end
    end
  
    puts "\nLes autres joueurs t'attaquent !"
    [player1, player2].each do |player|
      if player.life_points > 0
        player.attacks(real_player)
      end
    end
  end
  
  puts "La partie est finie."
  
  if real_player.life_points > 0
    puts "BRAVO ! TU AS GAGNÉ !"
  else
    puts "Loser ! Tu as perdu !"
  end




