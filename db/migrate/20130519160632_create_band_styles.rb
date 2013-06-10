class CreateBandStyles < ActiveRecord::Migration
  def change
    create_table :band_styles do |t|
      t.string :name

      t.timestamps
    end
  end
end
