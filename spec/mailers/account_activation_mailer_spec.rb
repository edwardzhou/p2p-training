require "spec_helper"

describe AccountActivationMailer do
  describe "notify_activation" do
    let(:mail) { AccountActivationMailer.notify_activation }

    it "renders the headers" do
      mail.subject.should eq("Notify activation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
