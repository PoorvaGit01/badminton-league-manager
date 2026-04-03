# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Players
player_names = [
  "Virat",
  "Rohit",
  "Dhoni"
]

players = player_names.map do |name|
  Player.create!(name: name)
end

puts "Created #{players.count} players"

10.times do
  p1, p2 = players.sample(2)

  winner, loser = [p1, p2].sample == p1 ? [p1, p2] : [p2, p1]

  Match.create!(
    winner: winner,
    loser: loser
  )
end

puts "Created #{Match.count} matches"