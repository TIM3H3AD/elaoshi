class CreateElements < ActiveRecord::Migration[6.0]
  def change
    create_table :elements do |t|
      t.integer :style
      t.string :text
      t.integer :score

      t.timestamps
    end
  end
end
