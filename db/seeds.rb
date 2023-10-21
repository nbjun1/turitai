# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者のログインデータ
  Admin.create!(
    email: ENV['ADMIN_EMAIL'],
    password: ENV['ADMIN_PASSWORD']
    )

#会員のテストデータ
  test_user = Member.create!(
    name: "テストデータ",
    email: ENV['MEMBER_EMAIL'],
    password: ENV['MEMBER_PASSWORD']
    )

# ジャンルの中身のリスト
genres = ['エサ釣り', 'ウキ釣り', 'ルアー釣り']

# ジャンルの中身を作成
genre_instances = genres.map { |genre_name| Genre.create(method: genre_name) }

prefectures = ['東京都', '大阪府', '北海道', '神奈川県', '愛知県']
cities = ['渋谷区', '大阪市', '札幌市', '川崎市', '名古屋市']
fish = ['ブリ', 'ヒラメ', 'スズキ', 'アオリイカ', '太刀魚', '鮎']

# 30件のテストデータを作成
30.times do |n|
  result = Result.create(
    title: "Test #{n + 1}",             # タイトルに数字を増やす形式
    body: "This is test #{n + 1}.",     # 本文に数字を増やす形式
    name: fish.sample,                  # 魚介名をランダムで生成
    prefecture: prefectures.sample,     # 都道府県をランダムで選択
    city: cities.sample,                # 市区町村名をランダムで選択
    genre_id: genre_instances.sample.id # ジャンルのインスタンスからidを取得
  )
  # テストユーザーが投稿したと仮定
  test_user.results << result
end
