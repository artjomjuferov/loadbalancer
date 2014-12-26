require 'sinatra'

class Client
  attr_accessor :threads_amount
  @responses = []
  
  def initialize(amount)
    @threads_amount = amount
  end
  
  def make_request(url, method)
      
  end
  
  def correct?
    @responses.each do |resp|
      return false if resp == "505"
    end
  end
  
end