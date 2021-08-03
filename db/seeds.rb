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

 Event.create(
    [
        {name: "ベンチプレス", genre_id: 1},
        {name: "スミスマシン・ベンチプレス", genre_id: 1},
        {name: "インクライン・ベンチプレス", genre_id: 1},
        {name: "ダンベル・ベンチプレス ", genre_id: 1},
        {name: "ダンベル・フライ", genre_id: 1},
        {name: "ケーブル・クロスオーバー", genre_id: 1},
        {name: "懸垂(チンニング)", genre_id: 1},
        {name: "ベントオーバーロウ", genre_id: 1},
        {name: "ケーブル・プルオーバー", genre_id: 1},
        {name: "デッドリフト", genre_id: 2},
        {name: "ルーマニアン・デッドリフト", genre_id: 2},
        {name: "スモウ・デッドリフト", genre_id: 2},
        {name: "ペック・フライ", genre_id: 1},
        {name: "ナロー・ベンチプレス", genre_id: 1},
        {name: "インクライン・ダンベル・ベンチプレス", genre_id: 1},
        {name: "インクライン・ダンベルフライ", genre_id: 1},
        {name: "アイソラテラル・デクライン・プレス", genre_id: 1},
        {name: "アイソラテラル・インクライン・プレス", genre_id: 1},
        {name: "ワンハンド・ダンベル・ローイング", genre_id: 1},
        {name: "ロー・プーリー・ロウ", genre_id: 1},
        {name: "ラット・プルダウン", genre_id: 1},
        {name: "アイソラテラル・ロウ", genre_id: 1},
        {name: "アイソラテラル・プルダウン", genre_id: 1},
    ]
)