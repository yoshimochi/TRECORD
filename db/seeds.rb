# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
#    email: 'admin@test.com',
#    password: 'password'
#  )
 
 User.create(
    [
       { name: "アーノルド", email: "arnold@test.com", password: "password", profile_image: File.open("#{Rails.root}/app/assets/images/seed/arnold.jpg") },
       { name: "エドワード", email: "eddy@test.com", password: "password", profile_image: File.open("#{Rails.root}/app/assets/images/seed/edword.jpg") },
       { name: "ジョンソン", email: "jon@test.com", password: "password", profile_image: File.open("#{Rails.root}/app/assets/images/seed/rock.jpg") },
       { name: "フロイド", email: "may@test.com", password: "password", profile_image: File.open("#{Rails.root}/app/assets/images/seed/may.jpg") },
       { name: "仁", email: "gin@test.com", password: "password", profile_image: File.open("#{Rails.root}/app/assets/images/seed/jin.jpg") }
       ]
    )