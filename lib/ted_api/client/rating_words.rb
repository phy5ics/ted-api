module TedApi
  class Client
    module RatingWords
      
      ##
      # http://developer.ted.com/API_Docs#languages
      
      def rating_words(rating_word=nil, options={}, raw=false)
        if rating_word.nil?
          get('rating_words', options, raw)
        else
          get("rating_words/#{rating_word}", options, raw)
        end
      end
      
    end
  end
end