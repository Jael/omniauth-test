class AddSomeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :qq, :string
    add_column :users, :telephone, :string
    add_column :users, :website, :string
    add_column :users, :bio, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :name, :string
  end
end
