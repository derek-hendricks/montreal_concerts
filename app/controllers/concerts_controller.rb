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
		if @track_id || @like_track_id
			get_track_comments
			embed_soundcloud_widget (@track_id || @like_track_id)
			if @like_track_id
				like @like_track_id
			end
		else
			@aristMusic = @client.get('/tracks', :q => @artist)
		end
  end

	def connect
		redirect_to @client.authorize_url()
	end

	private 

	  def get_params
	  	@artist = params[:id]
			@track_id = params[:comment]
			@like_track_id = params[:track_id]
	  end

	 def get_track_comments
  	@track = @client.get('/tracks/' + (@track_id || @like_track_id))
		@comments = Array.new
		@client.get("/tracks/#{@track_id || @like_track_id}/comments").each do |comment|
			@comments.push(comment)
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
