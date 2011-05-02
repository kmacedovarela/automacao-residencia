class HomeController < ApplicationController

  layout 'login'

  def index
    @usuario = Usuario.new
  end

end

