class AddColCapturedToPieces < ActiveRecord::Migration[5.1]
  def change
    add_column :pieces, :captured, :boolean
  end
end
