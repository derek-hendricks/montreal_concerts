class ConcertsController < ApplicationController
	before_filter :get_params
	before_filter :soundcloud_connect
	
	def index
		@doc = Nokogiri::HTML(open('http://www.cheapthrills.ca/news.html'), nil, 'ISO-8859-1')
		@doc.encoding = 'UTF-8'
	end

	def show
		@aristMusic = @client.get('/tracks', :q => @artist)
	end

	private 

	  def get_params
	  	@artist = params[:id]
	  end

end
