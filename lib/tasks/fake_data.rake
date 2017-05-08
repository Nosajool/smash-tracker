namespace :db do
  desc "Create lots of users and matches"
  task populate: :environment do
    25.times do |n|
      name  = Faker::Internet.user_name
      puts "Attempting to add #{name} to user table"
      User.create!(name: name)
    end

    1.upto(20) do |x|
      winning_character, losing_character = Character.order("Random()").take(2)
      winning_user, losing_user = User.order("Random()").take(2)
      stock = 1 + rand(4)
      Match.create!(
        winner_stock: stock,
        winner: winning_user,
        loser: losing_user,
        wcharacter: winning_character,
        lcharacter: losing_character
      )
    end
  end

end
