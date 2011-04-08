namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do

    languages_ids = Language.select("id").all.map { |lan| lan.id }

    User.delete_all
    20.times do
      u = User.new :email => Faker::Internet.email, :password => Faker::Lorem.words(1).first
      u.save
    end
    user_ids = User.select("id").all.map { |user| user.id }

    Snippet.delete_all
    20.times do
      s = Snippet.new :language_id => languages_ids.shuffle.first,
                      :user_id => user_ids.shuffle.first,
                      :private => [true, false].shuffle.first,
                      :content => Faker::Lorem.paragraph(2)
      s.save
    end
  end
end
