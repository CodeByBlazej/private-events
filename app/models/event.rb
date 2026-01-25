class Event < ApplicationRecord
  has_many :reservations
  has_many :users, throught: :invitations

  belongs_to :creator, class_name: "User",
  foreign_key: :creator_id

  validates :location, presence: true
  validates :date, presence: true
end
