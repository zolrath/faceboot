require 'mechanize'

class FaceBoot
  attr_accessor :agent, :page
  def initialize
    @agent = Mechanize.new
    @page = @agent.get 'http://m.facebook.com'
  end

  def login(email, pass)
    form = @page.forms.first
    form.email = email
    form.pass = pass
    @page = @agent.submit form
  end

  def post(message)
    form = @page.forms.first
    form.status = message
    @page = @agent.submit form
  end
end
