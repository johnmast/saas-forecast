class SessionsController < Devise::SessionsController
  # def new
  #   if request.subdomain.blank? || request.subdomain == "www"
  #     flash[:error] = "Access restricted!"
  #     redirect_to :root
  #   else
  #     super
  #   end
  # end
end