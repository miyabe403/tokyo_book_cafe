# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seeds.rbとは
# Webアプリの初期データを作ってくれるファイル
# Webアプリの動作確認やレイアウト修正必要箇所の発見などができるようになります。

# モデル名.create!から始まり、
# カラム名: "値"を必要数書くことでテストデータが作成できるようになります。
Admin.create!(email: 'admin@bookcafe.com', password: 'admin_pass')