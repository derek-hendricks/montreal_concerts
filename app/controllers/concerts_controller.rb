class ConcertsController < ApplicationController
	before_filter :get_params
	before_filter :soundcloud_connect
	
	def index
		@doc = Nokogiri::HTML(open('http://www.cheapthrills.ca/news.html'), nil, 'ISO-8859-1')
		@doc.encoding = 'UTF-8'
		if params[:code]
			sign_in
		end
	end

	def show
		@aristMusic = @client.get('/tracks', :q => @artist)
	end

	def connect
		redirect_to @client.authorize_url()
	end

	private 

	  def get_params
	  	@artist = params[:id]
	  end

end
