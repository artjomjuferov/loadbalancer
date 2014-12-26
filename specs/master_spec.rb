require File.expand_path '../spec_helper.rb', __FILE__

describe "Master" do
  it "should allow accessing the server" do
    get '/'
  end
end