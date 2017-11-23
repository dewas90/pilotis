class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
  	@disable_sidebar = true
  end

  def about
    @disable_sidebar = true
  end
end
