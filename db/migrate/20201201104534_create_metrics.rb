class CreateMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :metrics do |t|
      t.string :name
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
