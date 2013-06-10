class Band < ActiveRecord::Base
  belongs_to :band_style
  has_many :band_members
  has_many :users, :through => :band_members
end
