class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|

      t.string :name

      # Can either be a "responsibility" if this is an event template
      # If it isn't an event template, then it gets ad-hocked to a department
      t.references :responsibility, polymorphic: true # foreign_key: true
      t.string :note

      # Can be a user, a group, or an officer
      t.references :party, polymorphic: true # foreign_key: true, 
      t.belongs_to :event, foreign_key: true
      t.float :order_index
      t.string :auxiliary_text

      t.timestamps

      puts "HELLO"
    end
  end
end
