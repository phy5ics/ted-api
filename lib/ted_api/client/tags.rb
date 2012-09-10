module TedApi
  class Client
    module Tags
      
      ##
      # http://developer.ted.com/API_Docs#tags
      
      def tags(tag=nil, options={}, raw=false)
        if tag.nil?
          get('tags', options, raw)
        else
          get("tags/#{tag}", options, raw)
        end
      end
      
    end
  end
end