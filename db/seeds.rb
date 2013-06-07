# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
district = District.create([ {name: 'Cercado de Lima'}, {name: 'Ate'}, {name: 'Barranco'}, {name: 'Breña'}, {name: 'Comas'}, {name: 'Chorrillos'}, {name: 'El Agustino'}, {name: 'Jesús María'}, {name: 'La Molina'}, {name: 'La  Victoria'}, {name: 'Lince'}, {name: 'Magdalena del Mar'}, {name: 'Miraflores'}, {name: 'Pueblo Libre'}, {name: 'Puente Piedra'}, {name: 'Rimac'}, {name: 'San Isidro'}, {name: 'Independencia'}, {name: 'San Juan de Miraflores'}, {name: 'San Luis'}, {name: 'San Martin de Porres'}, {name: 'San Miguel'}, {name: 'Santiago de Surco'}, {name: 'Surquillo'}, {name: 'Villa María del Triunfo'}, {name: 'San Juan de Lurigancho'}, {name: 'Santa Rosa'}, {name: 'Los Olivos'}, {name: 'San Borja'}, {name: 'Villa El Savador'}, {name: 'Santa Anita'} ])
bandStyle = BandStyle.create([ { name: 'Rock and Roll'}, { name: 'Pop'}, { name: 'Metal'}, { name: 'Rap y Hip Hop'}, { name: 'Electronic Music'}, { name: 'Reggae'}, { name: 'Blues'}, { name: 'Country'}, { name: 'Reggaeton'}, { name: 'Cumbia'} ])