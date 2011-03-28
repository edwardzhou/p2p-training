require 'spec_helper'

describe Catalog do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "name" do
    before(:all) do
      Factory(:catalog)
    end

    describe "should be unique" do
      subject { Factory.build(:catalog) }
      it { should have_at_least(1).error_on(:name) }
    end
  end
end
