class Band < ActiveRecord::Base
  attr_accessible :name, :user_id, :band_style_id
  belongs_to :band_style
end
