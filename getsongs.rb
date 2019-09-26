# import postgres
require 'pg'

# connect to database
conn = PG.connect(dbname: 'pet_hotel')

# run this query
rows = conn.exec("select * from pets")

# loop through the response
p rows.each { |row| p row}