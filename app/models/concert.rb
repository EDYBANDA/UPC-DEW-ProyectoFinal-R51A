class Concert < ActiveRecord::Base
  attr_accessible :band_id, :local_id, :start_date, :end_date, :user_id

  validates :band, :presence => { message: " no seleccionada" }
  validates :local, :presence => { message: " no seleccionada" }
  validates :user, presence: true
  validates :end_date, presence: true
  validates :start_date, presence: true

  belongs_to :band
  belongs_to :local
  belongs_to :user

  validate :start_date_cannot_be_greater_today, :validate_availability

  def start_date_cannot_be_greater_today
  	if start_date < Time.zone.now
  		 errors.add(:start_date, " no puede ser menor que la fecha actual")
  	elsif start_date > end_date
  		 errors.add(:start_date, " el rango de fechas es incorrecto") 
  	end
  end

  def validate_availability
  	if local_id
		concerts = Concert.search_concert(local_id, start_date, end_date)
		if concerts
			if concerts.count > 0 
	  		 errors.add(:local_id, " ya reservado para el rango de fechas ingresadas")
	  		end
		end
	end
  end

  def self.search_concert(plocal_id, pstart_date, pend_date)
  		Local.find(plocal_id)
  			.concerts.where{ 
  				(
	  				(start_date.lt(pstart_date) & end_date.gt(pstart_date)) | 
	  				(start_date.lt(pend_date) & end_date.gt(pend_date)) 
  				) |
  				(
  					start_date.gteq(pstart_date) & end_date.lteq(pend_date)
  				)  				
  			}
  end
  def self.search_by_filter(pdistrict_id, pband_style_id, day, band_name)
    concerts = Concert.all
    if pdistict_id
      concerts = Concert.joins(:local).where{ {:local => ( id.eq(1) ) } }
    end


  end  
end
