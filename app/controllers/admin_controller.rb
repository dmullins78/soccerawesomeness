class AdminController < ApplicationController

  #before_filter :authorize_user!

  def authorize_user!
    unless current_user.admin?
      render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    end 
  end

end
