# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{ id: '1', name: 'diego', last_name: 'seminario', maternal_name: 'francia', gender: 'M', document_type: 'TIU', document_number: '222', email: 'diego_sc_89@hotmail.com', password_digest: '123456',password_salt: '$2a$10$jZiKNbo0GkXHoF8mEPC9Cu', password_hash: '$2a$10$jZiKNbo0GkXHoF8mEPC9CuwifaBt8as0G6HddpBJ/Sau1Oktjyz3W', user_rol_id: '1'}])
distritos = District.create([{ name: 'Lima' }, { name: 'Callao' }, { name: 'Lurin' }])
estilos = BandStyle.create([{ name: 'Rock' }, { name: 'Huayno' }, { name: 'Heavy' }])

