require 'time'

class Player
  attr_accessor :name, :life_points

  def initialize(name, life_points = 10)
    @name = name
    @life_points = life_points
  end

  def show_state
    puts "#{@name} a #{life_points} points de vie"
  end

  def gets_damage(damage_points)
    @life_points -= damage_points
    @life_points <= 0 ? (puts "le joueur #{@name} a été tué !") : show_state
  end

  def compute_damage
    rand(1..6)
  end

  def attacks(other_player)
    puts "le joueur #{@name} attaque le joueur #{other_player.name}"
    damage = compute_damage
    other_player.gets_damage(damage)
    puts "il lui inflige #{damage} points de dommages"
  end

 end
