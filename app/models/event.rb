class Event < ApplicationRecord
  has_many :reservations, foreign_key: "attended_event_id", dependent: :destroy
  has_many :attendees, through: :invitations, source: :attendee

  belongs_to :creator, class_name: "User",
  foreign_key: :creator_id

  validates :location, presence: true
  validates :date, presence: true
end
