class CreateRemetricPeople < ActiveRecord::Migration
  def change
    create_table :remetric_people do |t|

      t.timestamps
    end
  end
end
