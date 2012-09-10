module TedApi
  class Client
    module Talks
      
      ##
      # http://developer.ted.com/API_Docs#talks
      
      def talks(talk=nil, options={}, raw=false)
        if talk.nil?
          get('talks', options, raw)
        else
          get("talks/#{talk}", options, raw)
        end
      end
      
      def subtitles(talk, options={}, raw=false)
        get("talks/#{talk}/subtitles", options, raw)
      end
      
      def speakers_by_talk(talk, options={}, raw=false)
        get("talks/#{talk}/speakers", options, raw)
      end
      
    end
  end
end