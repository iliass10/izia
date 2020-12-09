class ChangeValueToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :results, :value, :float
  end
end
