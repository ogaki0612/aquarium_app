class CreateCategolies < ActiveRecord::Migration[6.0]
  def change
    create_table :categolies do |t|

      t.timestamps
    end
  end
end
