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
csv_blog = File.read(Rails.root.join('lib', 'seeds', 'heritage.csv'))
csv = CSV.parse(csv_blog, :headers => true, :encoding => 'ISO-8859-1')
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
lex = User.create(name: 'Lex B', username: 'lb', password: '123', bio: 'Comic creater and coder', admin: false)

f1 = Favorite.create(user: saima, monument: Monument.first)
f2 = Favorite.create(user: saima, monument: Monument.second)
f3 = Favorite.create(user: shannon, monument: Monument.third)
f4 = Favorite.create(user: shannon, monument: Monument.fourth)

t1 = Travelogue.create(title: 'Obama', blog: 'Ran by this high school that was renamed after Obama. Here\'s the story behind it..' , user: saima )
t2 = Travelogue.create(title: 'SouthEast USA', blog: 'I had no idea that there were still so many confederate monuments in the southeast of this country.', user: shannon )
t3 = Travelogue.create(title: 'Are Road Markers Monuments?', blog: 'What constitutes a monument?', user: saima )
t4 = Travelogue.create(title: 'Should monuments have a place in our museums?', blog: 'What relics of our past can tell us about our future and how museums can help', user: saima )

mt1= MonTravel.create(travelogue: t1, monument: Monument.third)
mt1= MonTravel.create(travelogue: t2, monument: Monument.fourth)
mt1= MonTravel.create(travelogue: t3, monument: Monument.fifth)
mt1= MonTravel.create(travelogue: t4, monument: Monument.second)




