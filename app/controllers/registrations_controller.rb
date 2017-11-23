class RegistrationsController < Devise::RegistrationsController
  def new
  	super do
  	@disable_sidebar = true
  	end
  end	

  protected
  

  def after_sign_up_path_for(resource)
    '/profiles/new' # Or :prefix_to_your_route
  end


end