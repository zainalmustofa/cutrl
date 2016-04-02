class LandingPagesController < ApplicationController
  def index
    @user = current_user
    @url = Url.new
  end
end
