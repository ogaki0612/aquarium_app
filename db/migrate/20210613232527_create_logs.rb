class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|

      t.timestamps
      t.string :title, null: false
      t.references :aqua, foreign_key: true
    end
  end
end
