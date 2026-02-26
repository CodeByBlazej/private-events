class RenameReservationsForAttwndance < ActiveRecord::Migration[8.0]
  def change
    rename_column :reservations, :user_id, :attendee_id
    rename_column :reservations, :event_id, :attended_event_id

    remove_index :reservations, name: "index_reservations_on_user_id" if index_name_exists?(:reservations, "index_reservations_on_user_id")
    remove_index :reservations, name: "index_reservations_on_event_id" if index_name_exists?(:reservations, "index_reservations_on_event_id")

    add_index :reservations, :attendee_id unless index_exists?(:reservations, :attendee_id)
    add_index :reservations, :attended_event_id unless index_exists?(:reservations, :attended_event_id)
    add_index :reservations, [ :attendee_id, :attended_event_id ], unique: true

    add_foreign_key :reservations, :users, column: :attendee_id unless foreign_key_exists?(:reservations, :users, column: :attendee_id)
    add_foreign_key :reservations, :events, column: :attended_event_id unless foreign_key_exists?(:reservations, :users, column: :attended_event_id)
  end
end
