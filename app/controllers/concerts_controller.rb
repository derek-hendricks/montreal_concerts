class ConcertsController < ApplicationController
	
	def index
		@doc = Nokogiri::HTML(open('http://www.cheapthrills.ca/news.html'), nil, 'ISO-8859-1')
		@doc.encoding = 'UTF-8'
	end

	def show
	end

end
