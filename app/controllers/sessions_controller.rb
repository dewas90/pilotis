class SessionsController < Devise::SessionsController
  def new
  	super do
  	@disable_sidebar = true
  	end
  end	
end