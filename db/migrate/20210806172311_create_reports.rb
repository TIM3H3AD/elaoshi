class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.integer :course
      t.integer :level
      t.integer :unit
      t.integer :classroom
      t.string :student_name
      t.string :scored_lead_0
      t.string :scored_lead_1
      t.string :scored_lead_2
      t.string :scored_lead_3
      t.string :scored_lead_4
      t.string :greeting
      t.string :salutation

      t.timestamps
    end
  end
end
