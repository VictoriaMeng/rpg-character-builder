User.create(username: "You", email: "me@hogwarts.edu", password: "123")
Game.create(name: "Dragon Age Inquisition")
Character.create do |c|
  c.name = "Revasa"
  c.race = "Elf"
  c.combat_class = "Mage"
  c.gender = "Female"
  c.game_id = 1
  c.user_id = 1
end
