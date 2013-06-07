class ChangeColumnLocal < ActiveRecord::Migration
  def up
  	remove_column :locals, :distrit
  	add_column :locals, :district_id, :integer  	
  end
end
