# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{ id: '1', name: 'manuel', last_name: 'francia', maternal_name: 'francia', gender: 'M', document_type: '1', document_number: '222', email: 'mfrancia@ttt.com', password: 'eeeeee' }])

