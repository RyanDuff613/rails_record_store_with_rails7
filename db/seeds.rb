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

p "Created #{Album.count} albums and #{Song.count} songs"