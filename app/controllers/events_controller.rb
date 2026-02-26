class EventsController < ApplicationController
  before_action :authenticate_user!

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end
  def index
    @events = Event.all
  end


  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.expect(event: [ :date, :location ])
  end
end
