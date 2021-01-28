class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
    @your_ticket = false
    if @log_in and Ticket.exists?(user_id: current_user.id)
      @your_ticket = Ticket.where(user_id: current_user.id)
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show

  end

  # GET /tickets/new
  def new

    @ticket = Ticket.new
    @event = Event.all
    @event_id = params[:event_id]
    unless Event.exists?(id: @event_id)
      redirect_to events_path, notice: 'Wrong id parameter'
    else
      @event_for_ticket = @event.find(@event_id)
    end

    if @log_in
      @user_id_to_buy_ticket = current_user.id
    else
      redirect_to events_path, notice: 'You must be logged in to buy tickets'
    end

  end

  # POST /tickets
  # POST /tickets.json
  def create

    @date_now = Date.today
    @amount = Integer(params[:ticket][:amount])
    @event_id = Integer(params[:ticket][:event_id])

    @this_event = Event.find_by(id: @event_id)
    @event_tickets_left = @this_event.amount_of_ticket

    @payment_success = '1212 1212 1212 1212'
    @payment_declined = '2323 2323 2323 2323'
    @payment_problem = '3434 3434 3434 3434'

    @user_card = params[:ticket][:card_number]
    @allow_to_buy = false

    case @user_card
    when @payment_success
      @allow_to_buy = true
    when @payment_declined
      redirect_to new_ticket_path(event_id: @event_id), notice: 'Your card has been declined.'
    when @payment_problem
      redirect_to new_ticket_path(event_id: @event_id), notice: 'Something went wrong with your transaction.'
    else
      redirect_to new_ticket_path(event_id: @event_id), notice: 'Wrong card number'
    end

    if (@amount > @event_tickets_left)
      redirect_to new_ticket_path(event_id: @event_id), notice: 'You cannot buy more tickets than are available'
    else
      if (@allow_to_buy)
        i = 0
        l = @amount

        while i < l do
          @ticket = Ticket.new(ticket_params)
          @ticket.purchase_date = @date_now
          code = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
          @string_code = (0...20).map { code[rand(code.length)] }.join
          @ticket.cancel_code = @string_code
          @ticket.save
          i += 1
        end
        ChangeAmount.new(@event_id, @amount)
        redirect_to tickets_path, notice: 'the ticket was purchased correctly'
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    ChangeAmount.new(@ticket.event_id, -1)
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    if Ticket.exists?(id: params[:id])
      @ticket = Ticket.find(params[:id])
    else
      redirect_to tickets_path, notice: 'Wrong id parameter'
    end
  end

  # Only allow a list of trusted parameters through.
  def ticket_params
    params.require(:ticket).permit(:user_id, :event_id, :purchase_date, :cancel_code)
  end
end
