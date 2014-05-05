namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    30.times do |n|
      chinese_name  = Faker::Name.name
      french_name   = Faker::Name.name
      Category.create!(
        chinese_name:   chinese_name,
        french_name:    french_name,
        published:      true,
        parent_id:      nil
        )
    end
  end
end