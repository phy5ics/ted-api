module TedApi
  class Client
    module Events
      
      ##
      # http://developer.ted.com/API_Docs#events
      
      def events(event=nil, options={}, raw=false)
        if event.nil?
          get('events', options, raw)
        else
          get("events/#{event}", options, raw)
        end
      end
      
    end
  end
end