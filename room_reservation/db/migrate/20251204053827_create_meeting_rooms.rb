class CreateMeetingRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :meeting_rooms do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
