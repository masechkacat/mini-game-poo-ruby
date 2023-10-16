# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/game'
require_relative 'lib/player'

puts "À ma droite 'Josiane'"
player1 = Player.new("Josiane")

puts "À ma gauche 'José'"
player2 = Player.new("José")

puts "Voici l'état de nos joueurs :"
player1.show_state
player2.show_state

while player1.life_points > 0 && player2.life_points > 0
  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  break if player2.life_points <= 0
  player2.attacks(player1)
  puts "Voici l'état de nos joueurs :"
  player1.show_state
  player2.show_state
end
# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.
#binding.pry