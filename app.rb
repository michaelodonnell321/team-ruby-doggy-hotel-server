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
   
   puts "in get"
    content_type :json
    rows = conn.exec("SELECT owners.id, owners.name, pets.pet, pets.breed, pets.color, pets.checked_in from pets join owners on owners.id = pets.owner_id;")
    # rows.map - rows is an array, map returns a new array
    puts rows
    
    if rows
      rows.map { |row| Hash[row.each_pair.to_a]}.to_json
    end

end

get '/owners' do
    content_type :json
    rows = conn.exec("select owners.id, owners.name, owners.id, count(*) as number_of_pets from owners join pets on pets.owner_id = owners.id group by owners.id")
    # rows = conn.exec("SELECT * FROM owners")
    rows.map { |row| Hash[row.each_pair.to_a]}.to_json
end 

post '/history' do
    @owner_id = params[:owner_id]
    @pet = params[:pet]
    @color = params[:color]
    @breed = params[:breed]
    payload = params
    payload = JSON.parse(request.body.read).symbolize_keys unless params[:path]
    rows = conn.exec("INSERT into pets (owner_id, pet, color, breed) values (#@owner_id, #@pet, #@color, #@breed")
    file = load_app.sitemap.find_resource_by_path payload[:path]
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