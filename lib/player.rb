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

 class HumanPlayer < Player
  attr_accessor :weapon_level


  def initialize(name, life_points = 100, weapon_level = 1)
    @weapon_level = weapon_level
    super(name, life_points)
  end

  def show_state
    puts "#{@name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    super * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"

    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)

    case health_pack
    when 1
      "Tu n'as rien trouvé... "
    when 2..5
      @life_points = (@life_points + 50) > 100 ? @life_points = 100 : @life_points + 50
      "Bravo, tu as trouvé un pack de +50 points de vie !"
    when 6
      @life_points = (@life_points + 80) > 100 ? @life_points = 100 : @life_points + 80
      "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end

 end
