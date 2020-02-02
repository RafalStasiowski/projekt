class SessionsController < ApplicationController
  def new
    session[:referrer] = request.referer
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user
      log_in user

      if admin?
        redirect_to dashboard_path
      else
        redirect_to root_path
      end
      
    else
      flash.now[:danger] = "Invalid email/password confirmation"
      render "new"
    end
  end

  def destroy
   
       log_out
       @ordered_items=0





       redirect_to foods_path
  end
end
