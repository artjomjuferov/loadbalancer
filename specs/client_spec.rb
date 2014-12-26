require File.expand_path '../spec_helper.rb', __FILE__
require File.expand_path '../../client.rb', __FILE__

describe "Client" do
  
  it "should have field amount" do
    amount = rand(50)
    bucky = Client.new(amount)
    expect(bucky.threads_amount ).to eq(amount)
  end
  
  it "should make one correct requests" do
    bucky = Client.new(1)
    res = bucky.make_request('http://apidock.com/')
    expect(res.to_s).to match /HTTPOK/
  end
  
  # it "should make many correct requests" do
  #   bucky = Client.new(13)
  #   res_arr = bucky.make_many_request('http://apidock.com/', 14)
  #   expect(res_arr).to be_correct_all?
  # end
  
end