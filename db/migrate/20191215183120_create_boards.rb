class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :description
      t.string :background_img
      t.string :background_color
      t.integer :progress

      t.timestamps
    end
  end
end
