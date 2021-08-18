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
       { name: "test", email: "test@test.com", password: "password" },
       { name: "アーノルド", email: "arnold@test.com", password: "password" },
       { name: "エドワード", email: "eddy@test.com", password: "password" },
       { name: "ジョンソン", email: "jon@test.com", password: "password" },
       { name: "フロイド", email: "may@test.com", password: "password" },
       { name: "仁", email: "gin@test.com", password: "password" }
    ]
  )

  Genre.create(
    [
      { name: "上半身" },
      { name: "下半身" },
      { name: "体幹" },
      ]
  )

  Event.create(
    [
      { name: "ベンチプレス", genre_id: 1 },
      { name: "インクラインバープレス", genre_id: 1 },
      { name: "ダンベルプレス", genre_id: 1 },
      { name: "ダンベルフライ", genre_id: 1 },
      { name: "チェストプレス", genre_id: 1 },
      { name: "ラットプルダウン", genre_id: 1 },
      { name: "ロープーリー", genre_id: 1 },
      { name: "チンニング", genre_id: 1 },
      { name: "ベントオーバーローイング", genre_id: 1 },
      { name: "バーベルカール", genre_id: 1 },
      { name: "ダンベルカール", genre_id: 1 },
      { name: "ハンマーカール", genre_id: 1 },
      { name: "トライセップスプレスダウン", genre_id: 1 },
      { name: "ショルダープレス", genre_id: 1 },
      { name: "オーバーヘッドプレス", genre_id: 1 },
      { name: "サイドレイズ", genre_id: 1 },
      { name: "デッドリフト", genre_id: 2 },
      { name: "スクワット", genre_id: 2 },
      { name: "ランジ", genre_id: 2 },
      { name: "レッグプレス", genre_id: 2 },
      { name: "レッグカール", genre_id: 2 },
      { name: "レッグエクステンション", genre_id: 2 },
      { name: "カーフレイズ", genre_id: 2 },
      { name: "クランチ", genre_id: 3 },
      { name: "レッグレイズ", genre_id: 3 },
      { name: "ハンギングレッグレイズ", genre_id: 3 }
      ]
  )

  Tag.create(
    [
      { name: "ビギナー" },
      { name: "トレーニー" },
      { name: "ダイエッター" },
      { name: "フィジーカー" }
      ]
  )
