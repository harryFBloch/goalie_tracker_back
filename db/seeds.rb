# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

homeGoalie = Goalie.create({first_name: "Harry", last_name: "Bloch", team: "Rangers"})
awayGoalie = Goalie.create({first_name: "h", last_name: "B", team: "Devils"})
home_game = Game.new({opposing_team: awayGoalie.team, date: "Febuary 22, 2019"})
home_game.goalie = homeGoalie
home_game.save

away_game = Game.new({opposing_team: homeGoalie.team, date: "Febuary 22, 2019"})
away_game.goalie = awayGoalie
away_game.save
