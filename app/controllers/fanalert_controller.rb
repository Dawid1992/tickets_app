class FanalertController < ApplicationController
  before_action :authenticate_user!


  def index
    @fanalert = current_user.fanalert.all
  end

  def new

    if(@log_in)
      @fanalert = Fanalert.new
      @user_to_alert = current_user.id
      @event_id = params[:event_id]

      if (Fanalert.exists?(event_id:@event_id, user_id:@user_to_alert))
        redirect_to events_path, notice: 'You already have a reminder set for this event'
      else
        @fanalert.event_id = @event_id
        @fanalert.user_id = @user_to_alert
        @fanalert.save
        redirect_to events_path, notice: 'Reminder set successfully'
      end
    else
      redirect_to events_path, notice: 'You must be logged in'
    end

  end

  def create
  end

  def destroy
    @fanalert = Fanalert.find(params[:id])
    if @fanalert.present?
      @fanalert.destroy
    end
    redirect_to fanalert_index_path, notice: 'Reminder deleted successfully'
  end


  def fanalert_params
    params.require(:fanalert).permit(:event_id, :user_id)
  end

end
