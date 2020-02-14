require_relative 'scrapper.rb'
require_relative 'data_formatter.rb'

class WhatsOn
  def initialize
    @title = "
		 _______________
		| /~~~~~~~~\ ||||
		||          |...|
		||          |   |
		| \________/  O |
		 ~~~~~~~~~~~~~~~	Time for some Netf... oh, sorry. Cable and relax.
		"
    @scrapo_guzman = ActiveScrapper.new('https://mi.tv/ar/iniciar')
    @dummy_user_email = 'f.culturallt@gmail.com'
    @dummy_user_pass = 'Imscrapping'
    @datty_format = UiCommons.new
  end

  def run
    @datty_format.loading(2)
    login
  end

  def login
    page = @scrapo_guzman.set_agent
    form = page.forms.first
    form.field_with(id: 'login-email').value = @dummy_user_email
    form.field_with(id: 'login-password').value = @dummy_user_pass
    form.submit
  end

  def scrap_website; end

  def draw; end
end
