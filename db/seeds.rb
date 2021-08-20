# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
    Cat.destroy_all

    Cat.create!(name:'Pablo',sex:'m',birth_date:'2016-12-10',color:'grey/white',description:'Territorial but very friendly to humans ,he will let you rub his belly,likes to sleep a lot')
    Cat.create!(name:'Sam',sex:'m',birth_date:'2014-1-20',color:'black/grey',description:'Smart and curious ,usually very friendly ,sometimes he might playfully nibble your hands,doesn\'t like Pablo')
    Cat.create!(name:'Dean',sex:'m',birth_date:'2014-1-20',color:'grey/white',description:'Very anxious and gets scared easily ,requires carefull treatment and gentle petting,sometimes goes crazy and starts chasing invisible targets')
    Cat.create!(name:'Nami',sex:'f',birth_date:'2016-10-10',color:'orange/white',description:'She is the cutest of the bunch.A really fragile ,but also sweet and caring cat .She likes to play with Pablo ,but sometimes he gets to her nerves!')
    Cat.create!(name:'Nelly',sex:'f',birth_date:'2019-9-17',color:'black/grey',description:'A very smart ,playful but also very naughty cat.She is not easy to handle, truly a little demon.If you catch her resting after a long play session you might appreciate her more gentle aspects!')
    Cat.create!(name:'Kanelos',sex:'m',birth_date:'2010-9-20',color:'orange',description:'Gentle and loving cat.Likes to go out and be a boss amidst the strays.')
end