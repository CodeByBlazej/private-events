class Invitation < ApplicationRecord
  belongs_to :attended_event, class_name: "Event"
  belongs_to :invited_attendee, class_name: "User"

  validates :invited_attendee_id, uniqueness: { scope: :attended_event_id }
end
