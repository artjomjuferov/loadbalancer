require 'sinatra'
require 'json'

get '/new' do
  get_db()
  @db['amount'].to_s
  increase_amount()
  @db['amount'].to_s
end


#private
def increase_amount
  @db['amount'] += 1
  save_db
end

def save_db
  fJson = File.open("db.json","w")
  fJson.write(@db.to_json)
  fJson.close()
end

def get_db
  fJson = File.open("db.json","r")
  @db = JSON.parse(fJson.read)
  fJson.close()
end