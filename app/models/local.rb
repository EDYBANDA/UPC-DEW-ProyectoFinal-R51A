class Local < ActiveRecord::Base
  attr_accessible :address, :district_id, :first_phone, :name, :lat, :lang
  validates_presence_of :name, :district_id, :first_phone, :address 
  validates :name, :uniqueness => true
  
  belongs_to :distrito
  has_many :concerts  
end
