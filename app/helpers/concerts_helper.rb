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

end
