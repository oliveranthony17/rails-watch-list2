require 'open-uri'
require 'json'

Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

puts "destroyed all - creating new"

api_url = "https://tmdb.lewagon.com/movie/top_rated"
films = JSON.parse(URI.open(api_url).read)["results"]

films.each do |film|
  Movie.create(
    title: film["title"],
    overview: film["overview"],
    poster_url: film["poster_path"],
    rating: film["vote_average"],
  )
  puts "created movie"
end

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

file = URI.open("https://gentwenty.com/wp-content/uploads/2013/07/Superheroes.jpg")
list = List.new(name: "Superhero")
list.photo.attach(io: file, filename: "superhero.png", content_type: "image/jpg")
list.save

Bookmark.create(movie_id: 1, list_id: 1, comment: "not watched this yet")

puts "finished"
