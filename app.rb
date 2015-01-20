require  File.expand_path '../database.rb', __FILE__
require  File.expand_path '../client.rb', __FILE__
require 'sinatra'
require 'haml'


db = Database.new("db.json")
db.clean_db()
PORTS_FOR_SERVERS = []


get '/' do
  db.add_req
  db.requests.to_s
end 

get '/settings' do
  haml :settings 
end 

post '/add_clients' do
  cl = Client.new(params['amount'].to_i)
  cl.make_many_request("/", params['threads'].to_i)
  redirect '/settings'
end 

def run_server(port)
  system("ruby app.rb -p #{port} -o $IP")
end


__END__
@@ layout 
%html 
  %head 
    %title Here will be statistic 
  %body 
    =yield 
  
@@ settings
%h1 Choose rule to add new server and clients
%div
  %p Add clients
  %form{action: "/add_clients", method: "post"}
    %label Amount of clients:
    %br
    %input{name: "amount", type: "text"}
    %label Amount of threads:
    %br
    %input{name: "threads", type: "text"}
    %input{value: "Run", type: "submit"}
    