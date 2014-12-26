require 'sinatra'
require 'json'
#every time will be in ms

get '/new' do
  new_request(request.ip).to_s
  get_frequance(Time.now, Time.now, dt)
end

#override Time
class Time
  #get time in milliseconds
  def to_ms
    (self.to_f * 1000.0).to_i
  end
end


#get frequnce for period
def get_frequance(from, to, dt)
  get_db()
  nums = @db['requests'].select{ |a| a >= from.to_ms and a <= to.to_ms }
  return 1.0*dt/nums
end


# return the time between current and previous request 
def new_request(ip)
  get_db()
  @db['amount'] += 1
  last_t = @db['last_req']
  now_t = Time.now.to_ms
  @db['requests'] << now_t
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