class Game
  attr_accessor :human_player, :enemies

  def initialize(human_name)
    @human_player = HumanPlayer.new(human_name)
    @enemies = []

    4.times do |i|
      enemy_name = "Player#{i + 1}"
      @enemies << Player.new(enemy_name)
    end
  end

  def kill_player(player)
    @enemies.delete(player)
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && !@enemies.empty?
  end

  def show_players
    @human_player.show_state
    puts "Il reste #{enemies.count} ennemi(s) en vie."
  end

  def menu
    puts "\nQuelle action veux-tu effectuer ?"
    puts "a - Chercher une meilleure arme"
    puts "s - Chercher à se soigner"
    puts "attaquer un joueur en vue :"

    display_enemy_options

    print ">>>"
  end

  def menu_choice(choice)
    case choice
    when "a"
      @human_player.search_weapon
    when "s"
      @human_player.search_health_pack
    when "0".."3"
      attack_index = choice.to_i
      if (0..@enemies.length - 1).include?(attack_index)
        attack_enemy(@enemies[attack_index])
        enemies_attack(@enemies[attack_index])
      else
        puts "Choix invalide."
      end
    else
      puts "Choix invalide."
    end
  end

  def display_enemy_options
    @enemies.each_with_index do |enemy, index|
      next if enemy.life_points <= 0
      puts "#{index} - #{enemy.name} a #{enemy.life_points} points de vie"
    end
  end

  def attack_enemy(enemy)
    if enemy.life_points > 0
      @human_player.attacks(enemy)
      kill_player(enemy) if enemy.life_points <= 0
    else
      puts "Ce joueur est déjà éliminé."
    end
  end

  def enemies_attack(enemy)
    if enemy && enemy.life_points > 0
      enemy.attacks(@human_player)
    end
  end
  
  def end
    puts "La partie est finie."
    if @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNÉ !"
    else
      puts "Loser ! Tu as perdu !"
    end
  end
end
