module TedApi
  class Client
    module Talks
      
      def talks(talk=nil, options={}, raw=false)
        if talk.nil?
          get('talks', options, raw)
        else
          get("talks/#{talk}", options, raw)
        end
      end
      
    end
  end
end