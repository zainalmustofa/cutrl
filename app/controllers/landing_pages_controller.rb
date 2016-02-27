class LandingPagesController < ApplicationController
  def index
    @url = Url.new
  end
end
