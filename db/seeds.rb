# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8
Admin.create(:name => '管理者', :email => 'admin1234@gmail.com', :password => 'admin1234')

Category.create(:name => '理科')
Category.create(:name => '音楽')
Category.create(:name => '家庭科')
Category.create(:name => '外国語')
Category.create(:name => '数学')
Category.create(:name => '国語')
Category.create(:name => '講演会')
Category.create(:name => 'その他')
