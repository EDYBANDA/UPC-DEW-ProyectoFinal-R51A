class HomeController < ApplicationController

	def index
		@ishome = 'active'
		@districts = District.all
		@band_styles = BandStyle.all
		@concerts = Concert.search_by_filter(nil, nil, nil, nil)
		respond_to do |format|
			format.html
		end
	end

end