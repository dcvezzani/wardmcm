OmniAuth::Strategies::Facebook

module OmniAuth
  module Strategies
    class Facebook < OmniAuth::Strategies::OAuth2
      def raw_info
        @raw_info ||= access_token.get('/me?fields=id,name,email').parsed || {}
      end
    end
  end
end

