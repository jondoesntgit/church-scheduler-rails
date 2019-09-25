class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :title
      t.references :department, foreign_key: true
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
