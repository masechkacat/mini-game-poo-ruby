require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "---------------------------------------------------"
puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
puts "---------------------------------------------------"

puts "Rentre ton nickname"
print ">>>"
name_of_real_player = gets.chomp

my_game = Game.new(name_of_real_player)

while my_game.is_still_ongoing?
    my_game.show_players
    my_game.menu
    choice = gets.chomp
    my_game.menu_choice(choice)
  end
  
  my_game.end
  
binding.pry