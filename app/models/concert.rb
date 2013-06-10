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
		  concerts = Concert.search_concert(id, local_id, start_date, end_date)

		if concerts
			if concerts.count > 0 
	  		 errors.add(:local_id, " ya reservado para el rango de fechas ingresadas")
	  		end
		end
	end
  end

  def self.search_concert(pid, plocal_id, pstart_date, pend_date)
  		Local.find(plocal_id)
  			.concerts.where{           
          (
            id.not_eq(pid)
          ) &
          (
    				(
  	  				(start_date.lt(pstart_date) & end_date.gt(pstart_date)) | 
  	  				(start_date.lt(pend_date) & end_date.gt(pend_date)) 
    				) |
    				(
    					start_date.gteq(pstart_date) & end_date.lteq(pend_date)
    				)
          )
  			}
  end

  def self.search_by_filter(pdistrict_id, pband_style_id, pday, pband_name)
    relation_band_to_band_style = "inner join band_styles on bands.band_style_id = band_styles.id"
    relation_local_to_district = "inner join districts on locals.district_id = districts.id"

    query = "Concerts.id as[concert_id], start_date, end_date, "
    query += "Bands.name as[band_name], Locals.name as[local_name], "
    query += "Users.name || ' ' || Users.last_name || ' ' || Users.maternal_name as[user_name], "
    query += "band_styles.name as[band_style_name], "
    query += "districts.name as[district_name]"

    concerts = Concert.select{}

    if pdistrict_id
      concerts = Concert.joins(:local).where{ {:local => (district_id.eq( pdistrict_id ))} }
    end

    if pband_style_id
      concerts = concerts.joins(:band).where{ {:band => (band_style_id.eq( pband_style_id ))} }
    end

    if pband_name
      concerts = concerts.joins(:band).where{ {:band => (name.matches( '%' + pband_name + '%' ))} }
    end

    if pday
      concerts = concerts.where{ start_date.lteq(pday) & end_date.gteq(pday) }
    end

    return concerts
      .joins(:band)
      .joins(:local)
      .joins(:user)
      .joins(relation_band_to_band_style)
      .joins(relation_local_to_district)
      .select{ query }

  end  
end
