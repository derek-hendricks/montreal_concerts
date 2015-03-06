module TrackHelper 

  def find_url string
    url_array = [] 
    string.scan(/(https?:\/\/([-\w\.]+)+(:\d+)?(\/([\w\/_\.]*(\?\S+)?)?)?)/).each do |url| 
      url_array.push(url[0])
    end
    return url_array
  end

end
