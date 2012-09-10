module TedApi
  class Client
    module Languages
      
      ##
      # http://developer.ted.com/API_Docs#languages
      
      def languages(language=nil, options={}, raw=false)
        if language.nil?
          get('languages', options, raw)
        else
          get("languages/#{language}", options, raw)
        end
      end
      
    end
  end
end