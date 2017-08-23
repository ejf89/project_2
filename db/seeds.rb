["Leia","Eric","Brian"].each do |name|
  User.create(
    username:"user#{name}",
    email: "user#{name}@example.com",
    password: "test123",
    user_pic: 'smiley.png'
  )
end

["Nature", "NYC", "Art", "Humor", "Dog", "Pasta", "WCW", "FBF", "TBT"].each do |tag_name|
  Tag.create(name: tag_name)
end

url = "http://www.defenders.org/sites/default/files/styles/large/public/dolphin-kristian-sekulic-isp.jpg"

(1..10).to_a.each do |number|
    Picture.create(
      image_url: url,
      title: "picture #{number}",
      user_id: User.first.id
    )
end

Picture.create(
  image_url: url,
  title: "I love Brooklyn",
  user_id: User.last.id
)

Comment.create(
  content: "Cool dolphin",
  picture_id: 1,
  user_id: 1
)

Comment.create(
  content: "Dolphins in Brooklyn!",
  picture_id: 1,
  user_id: 1
)

Tag.create(
  name: "tag1"
)
Tag.create(
  name: "tag2"
)
Tag.create(
  name: "tag3"
)
