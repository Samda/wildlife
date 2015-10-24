class WelcomeController < ApplicationController
  def index
    @wilflives = Wildlife.all
  end
end
