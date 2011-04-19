class HomeController < ApplicationController

  def index
    @usuario = Usuario.new
  end

end

