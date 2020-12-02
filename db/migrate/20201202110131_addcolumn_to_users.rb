class AddcolumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :gender, :string
    add_column :users, :birthdate, :date
    add_column :users, :weight, :integer
    add_column :users, :height, :integer
  end
end
