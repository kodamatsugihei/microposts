class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :hobby, :string
    add_column :users, :region, :string
  end
end
