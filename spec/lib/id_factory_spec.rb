require "rspec"
require "id_factory"
require 'key_number'

describe IdFactory do

  before :each do
    #order_id = KeyNumber.new({:name    => 'order_id',
    #                          :pattern => '%y%{index}',
    #                          :next_value => 1})
    #KeyNumber.should_receive(:find_by_name).with('order_id').and_return(order_id)
    Factory(:key_number, {:name => 'order_id', :pattern => '%y%{index}', :next_value => 1})
  end


  it "next(:order_id) should returns '1100001" do
    IdFactory.next_num(:order_id).should == '1100001'
  end

  it "double next(:order_id) should returns '1100002'" do
    lambda{
      IdFactory.next_num(:order_id)
      IdFactory.next_num(:order_id)
    }.call.should == '1100002'
  end

end