# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Monument.destroy_all
Travelogue.destroy_all
User.destroy_all
MonTravel.destroy_all
Favorite.destroy_all

require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'heritage.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    # byebug
    if row['Year Dedicated'] == nil
        yd = nil
    else 
        yd = row['Year Dedicated'].to_i
    end
    if row['Year Removed'] == nil
        yr = nil
    else
        yr = row['Year Removed'].to_i
    end
    monument = Monument.find_or_create_by(
        name: row['feature_name'],
        honorees: row['Honorees'],
        city: row['City'],
        county: row['County'],
        state: row['State'],
        latitude: row['Coordinates'].split(',')[0].to_f,
        longitude: row['Coordinates'].split(',')[1].to_f,
        symbol_type: row['Symbol Type'],
        sponsors: row['Sponsors'],
        year_dedicated: yd,
        year_removed: yr,
        tracking_status: row['Tracking Status'])   
end

saima = User.create(name: 'Saima Akhtar', username: 'sja', password: '123', bio: 'Architect turned Developer', admin: true)
shannon = User.create(name: 'Shannon Nabors', username: 'sn', password: '123', bio: 'Flatiron SE Coach and Flag lover', admin: false)

f1 = Favorite.create(user: saima, monument: Monument.first)
f2 = Favorite.create(user: saima, monument: Monument.second)
f3 = Favorite.create(user: shannon, monument: Monument.third)
f4 = Favorite.create(user: shannon, monument: Monument.fourth)

