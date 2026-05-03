class InvitationsController < ApplicationController
  before_action :set_event

  def create
    @invitation = @event.invitations.build(invitation_params)

    if @invitation.save
      redirect_to @event, notice: "Invitation sent!", status: :see_other
    else
      redirect_to @event, alert: @invitation.errors.full_messages.to_sentence, status: :see_other
    end
  end

  def new
    @invitation = Invitation.new
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def invitation_params
    params.expect(invitation: [ :invited_attendee_id ])
  end
end
