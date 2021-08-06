class AddDetailsToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :text, :text
  end
end
