namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    make_users
    make_pins
  end
end

def make_users
  10.times do
    username = Faker::Internet.user_name
    email = Faker::Internet.email
    password = 'password'

    User.create(username: username, email: email, password: password)
  end
end

def make_pins
  users = User.all

  users.each do |user|
    3.times do
      image = File.open(Dir.glob(File.join(Rails.root, 'public/images/sampleimages', '*')).sample)
      description = Faker::Lorem.sentence(5)

      user.pins.create(image: image, description: description)
    end
  end
end
