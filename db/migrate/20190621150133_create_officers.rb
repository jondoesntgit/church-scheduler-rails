class CreateOfficers < ActiveRecord::Migration[5.2]
  def change
    create_table :officers do |t|
      # t.index [:office_id, :user_id]
      # t.index [:user_id, :office_id]
      t.references :office, foreign_key: true
      t.references :user, foreign_key: true

      t.boolean :is_head, default: false
      t.boolean :is_assistant, default: false
      t.boolean :is_alternative, default: false
      t.timestamps
    end
  end
end
