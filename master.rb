require 'sinatra'
require 'json'

get '/new' do
  new_request.to_s
end




#override Time
class Time
  #get time in milliseconds
  def to_ms
    (self.to_f * 1000.0).to_i
  end
end


# return the time between current and previous request 
def new_request
  get_db()
  @db['amount'] += 1
  last_t = @db['last_req']
  now_t = Time.now.to_ms
  @db['last_req'] = now_t
  save_db()
  now_t-last_t
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