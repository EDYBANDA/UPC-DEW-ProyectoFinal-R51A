class BandStyle < ActiveRecord::Base
  attr_accessible :band_id, :name
  has_many :bands
end
