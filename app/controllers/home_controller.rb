class HomeController < ApplicationController

  def index
    @families = current_user.families
  end

end
