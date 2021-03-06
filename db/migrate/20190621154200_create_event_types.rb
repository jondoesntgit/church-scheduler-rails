class CreateEventTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :event_types do |t|
      t.string :name
      t.belongs_to :event_category, foreign_key: true

      t.timestamps
    end
  end
end
