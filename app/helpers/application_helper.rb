module ApplicationHelper
	def soundcloud_connect
		@client ||= Soundcloud.new(:client_id => ENV["CLIENT_ID"],
	                        :client_secret => ENV["CLIENT_SECRET"],
	                        :redirect_uri => ENV["REDIRECT_URL"])
	end
end
