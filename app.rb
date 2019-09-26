# import postgres
require 'pg'
require 'sinatra'
require 'json'

# connect to database
conn = PG.connect(dbname: 'pet_hotel')

# # run this query
# rows = conn.exec("select * from pets")

# # loop through the response
# p rows.each { |row| p row}

get '/history' do
    content_type :json
    rows = conn.exec("select * from pets")
    # rows.map - rows is an array, map returns a new array
    rows.map { |row| Hash[row.each_pair.to_a]}.to_json
end

get '/owners' do
    content_type :json
    rows = conn.exec("select owners.name, count(*) as number_of_pets from owners join pets on pets.owner_id = owners.id group by owners.name")
    # rows = conn.exec("SELECT * FROM owners")
    rows.map { |row| Hash[row.each_pair.to_a]}.to_json
end 

post '/' do
   'Put this in your pipe and smoke it!'
end

patch '/' do
   'Cock your hat - angles are attitudes.'
end
delete '/' do
   `You gotta love livin', baby, 'cause dyin' is a pain in the ass.`
end

get '/hello/:name' do |n|
 # matches "GET /hello/foo" and "GET /hello/bar"
 # params['name'] is 'foo' or 'bar'
 # n stores params['name']
 "Hello #{n}!"
end