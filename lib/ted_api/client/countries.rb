module TedApi
  class Client
    module Countries
      
      ##
      # http://developer.ted.com/API_Docs#countries
      
      def countries(country=nil, options={}, raw=false)
        if country.nil?
          get('countries', options, raw)
        else
          get("countries/#{country}", options, raw)
        end
      end
      
    end
  end
end