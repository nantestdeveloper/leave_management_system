class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    welcome_user_profile_path
  end
   def after_sign_in_path_for(resource)
    welcome_user_profile_path
  end
  def get_head(leave)
	 User.find_by(id: leave.reporting_head_name).email
  end
  def leaves_left
  	TotalLeaveAvailable.first.leave_total_account - Leave.all.where(user_id: current_user.id).count
  end
  def leave_credited
  	TotalLeaveAvailable.first.leave_total_account
  end

  def leaves_taken
    Leave.all.where(user_id: current_user.id).count
  end
end
