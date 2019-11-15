class WelcomeController < ApplicationController
  def index
  	
  end

  def user_profile
  	if current_user.is_head_user?
      @leaves = Leave.all.where(reporting_head_name: current_user.id).order("created_at DESC")
  	else
  	  @leaves = Leave.all.where(user_id: current_user.id).order("created_at DESC")
  	end
  	
  end

  def delete_leave
  	leave = Leave.find_by(id: params[:id])
  	leave.destroy
  	redirect_to welcome_user_profile_path
  end

  def change_leave_status
  	leave = Leave.find_by(id: params[:leave_id])
  	leave.update(leave_status: params[:status])
  	render json: leave
  end

  def create_leave
    unless current_user.is_head_user?
      if check_leave_count(current_user)
  	    leave = Leave.create(leave_params)
  	    ApplicationMailer.send_mail_of_leave(current_user.email,leave,"You have applied for the leave application.").deliver_later if leave.present?
        ApplicationMailer.send_mail_of_leave(get_head(leave),leave,"You have received leave application.").deliver_later if leave.present?
  	    flash[:success]="Your request sent to the reporting head. "
      else
        flash[:error]="You have already taken all leaves available. "
      end
    end
    redirect_to welcome_user_profile_path
  end
  def update_leave
  	leave =  Leave.find_by(id: params[:leave][:id])
  	leave.update(leave_params)
    flash[:success]="Leave data updated successfully. "
  	redirect_to welcome_user_profile_path
  end

  private

    def check_leave_count(current_user)
      total_leaves = TotalLeaveAvailable.first.leave_total_account
      leave_taken = Leave.all.where(user_id: current_user.id,leave_status: 'Approved').nil? ? 0 : Leave.all.where(user_id: current_user.id,leave_status: 'Approved').count
      ( total_leaves == leave_taken) ? false : true
    end

    def leave_params
	    params.require(:leave).permit(:name,:apply_date,:date_from,:to_date ,:reason_for_leave,:reporting_head_name,:user_id,:leave_status)
    end
end
