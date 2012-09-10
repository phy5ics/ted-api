module TedApi
  class Client
    module Speakers
      
      ##
      # http://developer.ted.com/API_Docs#speakers
      
      def speakers(speaker=nil, options={}, raw=false)
        if speaker.nil?
          get('speakers', options, raw)
        else
          get("speakers/#{speaker}", options, raw)
        end
      end
      
    end
  end
end