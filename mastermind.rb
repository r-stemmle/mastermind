require './lib/game'
require './lib/player'
require './lib/turn'
require './lib/guess'
require 'json'
json = File.read('winners.json')

game = Game.new

game.welcome
