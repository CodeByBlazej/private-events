class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    @reservation = current_user.reservations.find_or_initialize_by(attended_event: @event)

    if @reservation.persisted?
      redirect_to @event, alert: "You are already attending this event!"
    elsif @reservation.save
      redirect_to @event, notice: "You are now attending this event!"
    else
      redirect_to @event, alert: @reservation.errors.full_messages.to_sentence
    end
  end

  def destroy
    reservation = current_user.reservations.find_by!(attended_event: @event)
    reservation.destroy
    redirect_to @event, notice: "You are no longer attending this event."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
