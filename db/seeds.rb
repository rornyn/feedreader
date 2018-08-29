# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Feed.destroy_all
puts "==============Clear old feeds==========="

urls = []
["http://rss.cnn.com/rss/edition_world.rss", "http://rss.cnn.com/rss/edition_meast.rss", "http://rss.cnn.com/rss/money_news_international.rss", "http://rss.cnn.com/rss/edition_sport.rss", "http://rss.cnn.com/rss/edition_motorsport.rss" ].map do |rss_url|
 urls << {url: rss_url}
end

Feed.create(urls)
