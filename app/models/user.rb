class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, foreign_key: "attendee_id", dependent: :destroy
  has_many :attended_events, through: :reservations, source: :attended_event

  has_many :events, foreign_key: "creator_id", class_name: "Event"

  validates :name, presence: true
end
