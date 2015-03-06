module ConcertsHelper
	
	def sign_in
		code = params[:code]
		if (code && !session[:user])
			@client = Soundcloud.new(:client_id => ENV["CLIENT_ID"],
	                        :client_secret => ENV["CLIENT_SECRET"],
	                        :redirect_uri => ENV["REDIRECT_URL"])
			session[:token] = @client.exchange_token(:code => code)
			access_token = @client.exchange_token(:code => code)
			current_user = @client.get('/me')
			session[:user] = current_user.username
		end
	end


	def like track_id
  	@client = Soundcloud.new(:access_token => session[:token]['access_token'])
		@track = @client.get('/tracks/'+track_id)
		@client.put("/me/favorites/#{@track.id}")
	end

	def embed_soundcloud_widget track_id
    track = @client.get('/tracks/' + track_id)
	 	@embed_info = @client.get('/oembed', :url => track.permalink_url)
	 	@embedded_track = @embed_info['html'].html_safe
	end


end
