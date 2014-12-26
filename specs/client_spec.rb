require File.expand_path '../spec_helper.rb', __FILE__
require File.expand_path '../../app.rb', __FILE__

describe "Client" do
  
  it "should have field amount" do
    amount = rand(50)
    bucky = Client.new(amount)
    expect(bucky.threads_amount ).to eq(amount)
  end
  
  it "should make correct requests" do
    bucky = Client.new(12)
    arr_resp = bucky.make_request('https://loadbalancer-derevjaginti.c9.io/')
    expect(arr_resp).to be_correct?
  end
  
end