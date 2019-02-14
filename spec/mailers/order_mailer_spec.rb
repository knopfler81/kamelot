require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  describe "we_are_sorry", :skip => "A faire"do

    let(:mail) { OrderMailer.we_are_sorry(order) }

    it "renders the headers" do
      expect(mail.subject).to eq("Nous ne pouvons pas satisfaire votre demande")
      expect(mail.to).to eq(@order.user.email)
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Nous allons vous rembourser")
    end
  end

end
