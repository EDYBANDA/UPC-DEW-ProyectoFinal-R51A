class HomeController < ApplicationController

	def index
		@ishome = 'active'
		@districts = District.all
		@band_styles = BandStyle.all
		respond_to do |format|
			format.html
		end
	end

end