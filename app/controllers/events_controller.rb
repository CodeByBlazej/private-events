class EventsController < ApplicationController
  before_action :authenticate_user!

  def show
    @event = Event.find(params[:id])

    unless can_view?(@event)
      redirect_to events_path, alert: "This event is private. You need to be invited to view it!"
    end
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

  def can_view?(event)
    return true if event.creator == current_user
    return true if event.invited_attendees.exists?(current_user.id)

    false
  end
end
