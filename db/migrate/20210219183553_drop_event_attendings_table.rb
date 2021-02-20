class DropEventAttendingsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :event_attendings
  end
end
