class CreateEventTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :event_templates do |t|
      t.string :name
      t.timestamp :start_time
      t.timestamp :end_time
      t.references :event_template, foreign_key: true
      t.belongs_to :event_type, foreign_key: true
      t.string :address
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
