# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  Project.destroy_all
  Task.destroy_all
end
10.times do |i|
  Project.create(title: "Project #{i}", archive: [true, false].sample, created_at: (2.days.ago.to_date..Date.today).to_a.sample)
end

project_ids = Project.pluck(:id)
5.times do |i|
  Task.create(title: "Task #{i}", priority: (0..5).to_a.sample, project_id: project_ids.sample)
end
