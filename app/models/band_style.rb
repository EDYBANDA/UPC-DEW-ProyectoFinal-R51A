class BandStyle < ActiveRecord::Base
  attr_accessible :name
  has_many :bands
end
