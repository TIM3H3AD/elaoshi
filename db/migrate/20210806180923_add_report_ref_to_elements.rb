class AddReportRefToElements < ActiveRecord::Migration[6.0]
  def change
    add_reference :elements, :report, foreign_key: true

  end
end
