require 'spec_helper'

describe "Faceboot" do
  before(:each) do
    @bot = FaceBoot.new
  end

  it "can navigate to facebook" do
    @bot.page.title.should include('Facebook')
  end

  it "can login to facebook" do
    @bot.login
    @bot.page.title.should eql('Facebook')
  end

  it "can post to facebook" do
    #pending "not sure how to test this"
    @bot.login
    #@bot.post("Hello jim.")
    puts @bot.page.search "[text()*='transcribing']"
  end
end
