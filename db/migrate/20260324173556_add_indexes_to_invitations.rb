class AddIndexesToInvitations < ActiveRecord::Migration[8.0]
  def change
    add_index :invitations, :attended_event_id unless index_exists?(:invitations, :attended_event_id)
    add_index :invitations, :invited_attendee_id unless index_exists?(:invitations, :invited_attendee_id)
  end
end
