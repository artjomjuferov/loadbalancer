require File.expand_path '../spec_helper.rb', __FILE__
require File.expand_path '../../database.rb', __FILE__
require 'json'
require 'random-word'


describe "Database" do

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

end


  
  