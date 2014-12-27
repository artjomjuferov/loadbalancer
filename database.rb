require 'json'

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
  
  def amount
    load_db()
    @amount
  end

  def requests
    load_db()
    @requests
  end
  
  
end