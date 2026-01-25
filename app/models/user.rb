class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations
  has_many :events, through: :reservations

  has_many :created_events, foreign_key: "creator_id", class_name: "Event"

  validates :name, presence: true
end
