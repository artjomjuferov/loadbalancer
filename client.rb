require 'net/http'

class Client
  attr_accessor :threads_amount
  
  def initialize(amount)
    @threads_amount = amount
    @responses = []
  end
  
  def make_request(url)
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    @responses << res 
    res
  end
  
  def make_many_request(url, amount_thread)
    res_arr = []
    threads = []
    for i in 1..amount_thread do
      threads << Thread.new(i) do |i|
        res_arr << make_request(url)
      end
    end
    
    threads.each { |aThread|  aThread.join }
    
    res_arr
  end
  
  
  def correct_all?(res_array)
    # res_array.each do |res|
    #   return false if res == "505"
    # end
    return true
  end
  
end