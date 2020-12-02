class AddFisrtNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :birthdate :t.date
    add_column :users, :weight :interger
    add_column :users, :height :integer
  end
end
