require File.expand_path '../spec_helper.rb', __FILE__
require File.expand_path '../../database.rb', __FILE__
require 'json'
require 'random-word'


describe "Database" do
  after(:all) do 
    Dir['*.json'].each do |db_name|
      File.delete(db_name)
    end
  end
  
  subject { Database.new(RandomWord.adjs.next+".json") }
  
  it "should delete db file" do
    path = subject.delete_db()
    expect {File.open(path)}.to raise_error
  end
  
  context "correct initial state" do
    it { is_expected.to be_an_instance_of(Database)}
    it { expect(subject.amount).to eq(0)}
    it { expect(subject.requests.class).to eq([].class)}
  end
  
  it "should correctly add request" do
    subject.add_req(Time.now)
    expect(subject.amount).to eq(1)
    subject.add_req(Time.now)
    expect(subject.amount).to eq(2)
  end
  
  it "should return correct time" do
    subject.add_req(Time.now)
    expect(subject.requests[0]).to be_an_instance_of(1.class)
  end

end


  
  