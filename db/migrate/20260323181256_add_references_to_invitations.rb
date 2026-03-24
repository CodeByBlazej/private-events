class AddReferencesToInvitations < ActiveRecord::Migration[8.0]
  def change
    add_reference :invitations, :attended_event, null: false, foreign_key: { to_table: :events }, index: false
    add_reference :invitations, :invited_attendee, null: false, foreign_key: { to_table: :users }, index: false

    add_index :invitations, [ :attended_event_id, :invited_attendee_id ], unique: true
  end
end
