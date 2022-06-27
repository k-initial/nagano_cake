# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admins = [
  {email: 'admin1@example.com', password: 'passw@rd'},
  {email: 'admin2@example.com', password: 'passw@rd'},
  {email: 'admin3@example.com', password: 'passw@rd'},
  {email: 'admin4@example.com', password: 'passw@rd'},
  {email: 'admin5@example.com', password: 'passw@rd'},
]

admins.each do |admin|
  # 一度ユーザーをメールアドレスで検索
  admin_data = Admin.find_by(email: admin[:email])
  # 該当ユーザーがいなければ、createする
  if admin_data.nil?
    Admin.create(
      email: admin[:email],
      password: admin[:password]
    )
  end
end