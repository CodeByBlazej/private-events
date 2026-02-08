class AddNullConstraintsToEvents < ActiveRecord::Migration[8.0]
  def change
    change_column_null :events, :location, false
    change_column_null :events, :date, false
  end
end
