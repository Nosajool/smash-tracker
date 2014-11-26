namespace :db do
  desc "Create lots of users and matches"
  task populate: :environment do
    25.times do |n|
      name  = Faker::Internet.user_name
      puts "Attempting to add #{name} to user table"
      User.create!(name: name)
    end

    # Create some matches

    for x in (1..480)
      w_char_id = Character.order("Random()").first.id
      l_char_id = Character.order("Random()").first.id
      while(l_char_id == w_char_id)
        l_char_id = Character.order("Random()").first.id
      end
      w_id = User.order("Random()").first.id
      l_id = User.order("Random()").first.id
      while(l_id == w_id)
        l_id = User.order("Random()").first.id
      end
      stock = 1 + rand(4)
      Match.create!(winner_stock: stock,
                    winner_id: w_id,
                    loser_id: l_id,
                    wcharacter_id: w_char_id,
                    lcharacter_id: l_char_id)
    end


  end
end