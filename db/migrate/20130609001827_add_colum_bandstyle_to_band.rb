class AddColumBandstyleToBand < ActiveRecord::Migration
  def change
  	add_column :bands, :band_style_id, :integer  	
  end
end
