module TedApi
  class Client
    module Themes
      
      ##
      # http://developer.ted.com/API_Docs#themes
      
      def themes(theme=nil, options={}, raw=false)
        if theme.nil?
          get('themes', options, raw)
        else
          get("themes/#{theme}", options, raw)
        end
      end
      
    end
  end
end