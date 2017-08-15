# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create(email: 'admin@foodonline.com', password: 'password')
TimeSlot.create([{"start_date"=>Date.today, "start_time"=>"00:59", "end_date"=>Date.today + 1.month, "end_time"=>"23:59", "is_special"=>"0"}])
TimeSlot.create([{"start_date"=>Date.today, "start_time"=>"10:00", "end_date"=>Date.today + 1.month, "end_time"=>"14:00", "is_special"=>"0"}])
TimeSlot.create([{"start_date"=>Date.today, "start_time"=>"17:00", "end_date"=>Date.today + 1.month, "end_time"=>"17:00", "is_special"=>"0"}])
TimeSlot.create([{"start_date"=>Date.today, "start_time"=>"19:00", "end_date"=>Date.today + 1.month, "end_time"=>"22:00", "is_special"=>"0"}])