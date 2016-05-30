class RegistrationsController < Devise::RegistrationsController
  
  def new
    if request.subdomain.blank? || request.subdomain == "www"
      super
    else
      flash[:error] = "Access restricted!"
      redirect_to :root
    end
  end
  
  protected
    def after_sign_up_path_for(resource)
      new_user_session_url(subdomain: resource.subdomain)
    end
    
    def after_inactive_sign_up_path_for(resource)
      new_user_session_url(subdomain: resource.subdomain)
    end
end