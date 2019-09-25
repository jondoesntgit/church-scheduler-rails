class CreateResponsibilities < ActiveRecord::Migration[5.2]
  def change
    create_table :responsibilities do |t|
      t.string :name
      t.references :department, foreign_key: true
      t.references :event_template, foreign_key: true
      t.float :order_index

      t.timestamps
    end
  end
end
