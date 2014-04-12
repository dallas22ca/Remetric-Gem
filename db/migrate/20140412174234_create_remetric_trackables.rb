class CreateRemetricTrackables < ActiveRecord::Migration
  def change
    create_table :remetric_trackables do |t|

      t.timestamps
    end
  end
end
