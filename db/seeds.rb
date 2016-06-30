# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Group.create()
Group.create()
Group.create()
Group.create()
Group.create()
Group.create()
Group.create()
Group.create()
Group.create()
Group.create()

Assignment.create(title: "both due", description: 'asdf', draft_due: "2016-06-30 14:20:00", final_due: "2016-06-30 14:20:00")
Assignment.create(title: "draft due", description: 'asdf', draft_due: "2016-06-30 14:20:00", final_due: "2017-06-30 14:20:00")
Assignment.create(title: "neither due", description: 'asdf', draft_due: "2017-06-30 14:20:00", final_due: "2017-06-30 14:20:00")

User.create(name: 'Maria', email: 'maltebar@brandeis.edu', nickname:"Maria", password: '12345678', admin: true)
User.create(name: 'Betty', email: 'betty@brandeis.edu', nickname:'Bets', password: '12345678', admin: false)
User.create(name: 'Mar', email: 'mar@brandeis.edu', nickname:'Mar', password: '12345678', admin: false)
User.create(name: 'Joe', email: 'joe@brandeis.edu', nickname:'Joe', password: '12345678', admin: false)
User.create(name: 'Lisa', email: 'lisa@brandeis.edu', nickname:'lisa', password: '12345678', admin: false)
User.create(name: 'Bob', email: 'bob@brandeis.edu', nickname:'bob', password: '12345678', admin: false)
User.create(name: 'Sally', email: 'sally@brandeis.edu', nickname:'sally', password: '12345678', admin: false)
User.create(name: 's1', email: 's1@brandeis.edu', nickname:'s1', password: '12345678', admin: false)
User.create(name: 's2', email: 's2@brandeis.edu', nickname:'s2', password: '12345678', admin: false)
User.create(name: 's3', email: 's3@brandeis.edu', nickname:'s3', password: '12345678', admin: false)
User.create(name: 's4', email: 's4@brandeis.edu', nickname:'s4', password: '12345678', admin: false)
User.create(name: 's5', email: 's5@brandeis.edu', nickname:'s5', password: '12345678', admin: false)
User.create(name: 's6', email: 's6@brandeis.edu', nickname:'s6', password: '12345678', admin: false)
User.create(name: 's7', email: 's7@brandeis.edu', nickname:'s7', password: '12345678', admin: false)
User.create(name: 's8', email: 's8@brandeis.edu', nickname:'s8', password: '12345678', admin: false)
User.create(name: 's9', email: 's9@brandeis.edu', nickname:'s9', password: '12345678', admin: false)
User.create(name: 's10', email: 's10@brandeis.edu', nickname:'s10', password: '12345678', admin: false)
User.create(name: 's11', email: 's11@brandeis.edu', nickname:'s11', password: '12345678', admin: false)
User.create(name: 's12', email: 's12@brandeis.edu', nickname:'s12', password: '12345678', admin: false)
User.create(name: 's13', email: 's13@brandeis.edu', nickname:'s13', password: '12345678', admin: false)
User.create(name: 's14', email: 's14@brandeis.edu', nickname:'s14', password: '12345678', admin: false)
User.create(name: 's15', email: 's15@brandeis.edu', nickname:'s15', password: '12345678', admin: false)
User.create(name: 's16', email: 's16@brandeis.edu', nickname:'s16', password: '12345678', admin: false)