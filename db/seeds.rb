# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "🌱 Seeding routes..."

user = User.first

Route.create!(
  title: "高知の満足コース",
  description: "海沿いを気持ちよく走っていくコース！基本は平坦だが、上りも結構あって楽しいコースだよ！！何と言っても景色が最高のコースだからぜひ走ってみてください！",
  user: user
)

puts "✅ Route seed complete!"
