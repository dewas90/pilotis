class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  	@disable_sidebar = true
  end

  def about
  end
end
