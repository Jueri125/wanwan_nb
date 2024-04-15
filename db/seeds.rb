 Admin.create!(
   email: 'aaa@aaa',
   password: 'aaaaaa'
 )

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tanaka_a = User.find_or_create_by!(email: "tanaka.a@example.com") do |user|
  user.name = "田中 敦"
  user.name_kana ="タナカ アツシ"
  user.password = "password"
  user.introduction ="犬が大好きです！"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/no_image.jpg"), filename:"sample-user1.jpg")
end

suzuki_m = User.find_or_create_by!(email: "suzuki.m@example.com") do |user|
  user.name = "鈴木 美穂"
  user.name_kana ="スズキ ミホ"
  user.password = "password"
  user.introduction ="ポメラニアン飼ってます！よろしくお願いします♡"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/no_image.jpg"), filename:"sample-user2.jpg")
end

satou_a = User.find_or_create_by!(email: "satou.a@example.com") do |user|
  user.name = "佐藤 綾香"
  user.name_kana ="サトウ アヤカ"
  user.password = "password"
  user.introduction ="犬とお出かけするのが趣味です＾＾"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/no_image.jpg"), filename:"sample-user3.jpg")
end



review1 = Review.find_or_create_by!(title: "わんわんパーク") do |review|
  review.prefecture_id = 8
  review.content = "わんちゃんの足腰に優しい人口芝です！安心して遊べます♪"
  review.address = "茨城県〇〇〇◇◇◇"
  review.price=500
  review.review_type = 0
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/img.wanwan/afra-ramio-cp2HCVzguw4-unsplash.jpg"), filename:"sample-user2.jpg")
end

review2 = Review.find_or_create_by!(title: "アオイカフェ") do |review|
  review.prefecture_id = 11
  review.content = "わんちゃんと一緒にくつろげるカフェです。おすすめは自家製アップルです。"
  review.address = "埼玉県〇〇〇◇◇◇"
  review.review_type = 1
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/img.wanwan/kristaps-grundsteins-tQMXs0ee8B0-unsplash.jpg"), filename:"sample-user2.jpg")

end

review3 = Review.find_or_create_by!(title: "ワンズコテージ") do |review|
  review.prefecture_id = 9
  review.content = "自然に囲まれたコテージです。コテージ周辺にはお出かけスポットが沢山あります。"
  review.address = "栃木県〇〇〇◇◇◇"
  review.review_type = 2
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/img.wanwan/vu-anh-ExOmPidaHvY-unsplash.jpg"), filename:"sample-user2.jpg")

end

review4 = Review.find_or_create_by!(title: "フリスビー大会") do |review|
  review.prefecture_id = 12
  review.content = "決められたエリアの中に投げたフリスビーを愛犬がキャッチします。それを60秒間繰り返して得点の合計を競い合います。"
  review.address = "千葉県〇〇〇◇◇◇"
  review.price=500
  review.review_type = 3
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/img.wanwan/c-perret-cw97-XL4PFI-unsplash.jpg"), filename:"sample-user2.jpg")

end

comment1 = Comment.find_or_create_by!(content: "スタッフの方が優しく、ドックランも広くて楽しかったです！") do |comment|
  comment.user_id = tanaka_a.id
  comment.review_id = review1.id
end

comment2 = Comment.find_or_create_by!(content: "わんちゃん用のメニューも沢山ありました！アップルパイ美味しかったです！") do |comment|
  comment.user_id = tanaka_a.id
  comment.review_id = review2.id
end

comment3 = Comment.find_or_create_by!(content: "自然豊かでわんちゃんもとても喜んでいました！また来たいです＾＾") do |comment|
  comment.user_id = suzuki_m.id
  comment.review_id = review3.id
end

comment4 = Comment.find_or_create_by!(content: "みんなとても頑張っていました！楽しかったです！") do |comment|
  comment.user_id = satou_a.id
  comment.review_id = review4.id
end
