require "rspec"
require "id_factory"
require 'key_number'

describe IdFactory do

  before :all do
    order_id = KeyNumber.new({:name    => 'order_id',
                              :pattern => '%y%{index}',
                              :current => 0})
    KeyNumber.should_receive(:find_by_name).with('order_id').and_return
  end


  it "next(:order_id) should returns '1100001" do
    IdFactory.next(:order_id).should == '1100001'
  end
end