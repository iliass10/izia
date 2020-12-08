class AddUnitToMetrics < ActiveRecord::Migration[6.0]
  def change
    add_column :metrics, :unit, :string
  end
end
