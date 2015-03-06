require 'test_helper'

class TrackHelperTest < ActionView::TestCase
	test "test url helper returns array of urls" do 
		assert_equal find_url("string"), []
	end

	test "conditional on test url helper returning valid urls" do 
		assert_equal ['http://www.google.ca', 'http://www.nhl.com'], find_url("http://www.google.ca hello i am a great song. i like ruby. http://www.nhl.com")
	end

	test "conditional on test url returning valid urls with irregualar url input" do 
		assert_equal ['https://montreal-concerts.herokuapp.com/concerts/'], find_url('sadnafnalsdkjnflaehowfaksjdnfhttps://montreal-concerts.herokuapp.com/concerts/%0D%0ADODOS%20+%20SPRINGTIME%20CARNIVOREasdfojaewfjnasdifjb')
	end
end