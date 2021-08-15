# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@test.com',
   password: 'password'
 )

 User.create(
    [
       { name: "アーノルド", email: "arnold@test.com", password: "password", profile_image: File.open("#{Rails.root}/app/assets/images/seed/arnold.jpg") },
       { name: "エドワード", email: "eddy@test.com", password: "password", profile_image: File.open("#{Rails.root}/app/assets/images/seed/edword.jpg") },
       { name: "ジョンソン", email: "jon@test.com", password: "password", profile_image: File.open("#{Rails.root}/app/assets/images/seed/rock.jpg") },
       { name: "フロイド", email: "may@test.com", password: "password", profile_image: File.open("#{Rails.root}/app/assets/images/seed/may.jpg") },
       { name: "仁", email: "gin@test.com", password: "password", profile_image: File.open("#{Rails.root}/app/assets/images/seed/jin.jpg") }
    ]
  )

  Event.create(
    [
        {name: "ベンチプレス ", genre_id: 1},
        {name: "インクラインプレス", genre_id: 1},
        {name: "ダンベルプレス", genre_id: 1 },
        {name: "ダンベルフライ", genre_id: 1},
        {name: "ケーブル・クロスオーバー", genre_id: 1},
        {name: "チンニング", genre_id: 1},
        {name: "ベントオーバーロウ", genre_id: 1},
        {name: "ペクトラルフライ", genre_id: 1},
        {name: "スクワット", genre_id: 2},
        {name: "デッドリフト", genre_id: 2},
        {name: "スモウ・デッドリフト", genre_id: 2},
        {name: "レッグエクステンション", genre_id: 2},
        {name: "レッグカール", genre_id: 2},
        {name: "レッグプレス", genre_id: 2},
        {name: "ハックスクワット", genre_id: 2},
        {name: "カーフ・レイズ", genre_id: 2},
        {name: "バーベルカール", genre_id: 1},
        {name: "ダンベルカール", genre_id: 1},
        {name: "トライセプスプレスダウン", genre_id: 1},
        {name: "トライセプス・エクステンション", genre_id: 1},
        {name: "サイドレイズ", genre_id: 1},
        {name: "ダンベル・ショルダープレス", genre_id: 1},
        {name: "バーベル・ショルダープレス", genre_id: 1},
        {name: "スミスマシン・ショルダープレス"},
        {name: "クランチ", genre_id: 3},
        {name: "シットアップ", genre_id: 3},
        {name: "レッグレイズ", genre_id: 3},
        {name: "アブローラー", genre_id: 3},
        {name: "ハンギングレッグレイズ", genre_id: 3}
    ]
)
