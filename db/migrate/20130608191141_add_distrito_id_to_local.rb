class AddDistritoIdToLocal < ActiveRecord::Migration
  def change
    add_column :locals, :distrito_id, :integer
  end
end
