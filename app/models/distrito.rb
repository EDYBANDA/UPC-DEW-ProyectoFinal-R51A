class Distrito < ActiveRecord::Base
	has_many	:locals
  attr_accessible :name
end
