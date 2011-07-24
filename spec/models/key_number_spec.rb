require 'spec_helper'

describe KeyNumber do
  describe "start next_value with 1" do
    before :all do
      Factory(:key_number, {:name => 'order_id', :pattern => '%y%{index}', :next_value => 1})
    end

    it "order_id#next should return 1" do
      order_id = KeyNumber.get('order_id')
      order_id.next.should == 1
    end

  end
end
