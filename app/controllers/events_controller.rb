class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :only_admin, only: [:edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all




  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def only_admin
    if @log_in
      unless current_user.admin?
        redirect_to events_path, notice: 'Not allow to edit'
      end
    else
      redirect_to events_path, notice: 'Not allow to edit'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    if Event.exists?(id: params[:id])
      @event = Event.find(params[:id])
    else
      redirect_to events_path, notice: 'Wrong id parameter'
    end
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:event_name, :description, :price_by_ticket, :amount_of_ticket, :event_date, :event_time, :city, :address)
  end
end
