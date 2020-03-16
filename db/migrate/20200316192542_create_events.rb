class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamp :dated_at

      t.timestamps
    end
  end
end
