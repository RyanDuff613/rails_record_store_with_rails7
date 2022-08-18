Album.destroy_all
Song.destroy_all

5.times do |album_index|
  @album = Album.create!(name: "#{Faker::Job.field}" + " #{Faker::Verb.base}",
                         genre: Faker::Music.genre,
                         year: "19#{Faker::Number.number(digits: 2)}")
    10.times do |song_index|
      Song.create!(name: "#{Faker::Emotion.noun}" + " #{Faker::Verb.past_participle}" ,
                   lyrics: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
                   album_id: @album.id)
    end
end

User.create!(email:"admin@gmail.com", password:"admin", admin:true)
User.create!(email:"nonadmin@gmail.com", password:"nonadmin", admin:false)

p "Created #{Album.count} albums, #{Song.count} songs and #{User.count} users."
p "User Credentials for Admin: Email: admin@gmail.com, Password: password"
p "User Credentials for Admin: Email: nonadmin@gmail.com, Password: password"