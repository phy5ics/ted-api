module TedApi
  class Client
    module Quotes
      
      ##
      # http://developer.ted.com/API_Docs#quotes
      
      def quotes(quote=nil, options={}, raw=false)
        if quote.nil?
          get('quotes', options, raw)
        else
          get("quotes/#{quote}", options, raw)
        end
      end
      
    end
  end
end