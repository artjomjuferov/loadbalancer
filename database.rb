require 'json'


class Time
  #get time in milliseconds
  def to_ms
    (self.to_f * 1000.0).to_i
  end
end

class Database
  
  def initialize(path_to_json)
    @path = path_to_json
    load_db()
  end
  
  def delete_db()
    begin
      File.delete(@path)
      path = @path
      @path = nil
      @amount = nil
      @requests = nil
    rescue
      path =nil
    end
    path
  end
  
  def clean_db()
    load_db()
    @amount = 0
    @requests = 0
    save_db()
  end
  
  def load_db()
    begin
      fJson = File.open(@path,"r")
      db = JSON.parse(fJson.read)
      fJson.close()
      db['amount'] = 0 if db['amount'] == nil
      db['requests'] = [] if db['requests'].class != [].class
      @amount = db['amount']
      @requests = db['requests']
    rescue
      @amount = 0
      @requests = []
      save_db()
    end
  end
  
  def save_db()
    fJson = File.open(@path,"w")
    db = {}
    db['amount'] = @amount 
    db['requests'] = @requests
    fJson.write(db.to_json)
    fJson.close()
  end
  
  def add_req
    t = Time.now.to_ms
    load_db()
    @requests << t
    @amount += 1
    save_db()
  end
  
  #get frequnce for period
  def get_frequance(from, to, dt)
    load_db()
    nums = @db['requests'].select{ |a| a >= from.to_ms and a <= to.to_ms }
    return 1.0*dt/nums
  end

  
  def amount
    load_db()
    @amount
  end

  # return Time Time.at(1056030443784/1000.0).
  def requests
    load_db()
    @requests
  end
  
  
end