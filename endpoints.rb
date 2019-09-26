# Endpoints
require 'sinatra'

get '/' do
   'Hello world!'
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