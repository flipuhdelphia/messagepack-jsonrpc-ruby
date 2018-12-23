require 'httparty'
require 'msgpack'

module MessagePack
  module JSONRPC
    class HTTPClient
      include HTTParty

      attr_accessor :endpoint

      JSONRPC_VERSION = '2.0'
      CONTENT_TYPE    = 'application/x-msgpack'

      class NilOrEmptyResponseError < StandardError; end

      def initialize(endpoint)
        @endpoint = endpoint
      end

      def remote_call(method, params={})
        resp_body = self.class.post(
          endpoint,
          body:    encoded_payload(method, params),
          headers: headers,
        ).body

        if resp_body.nil? or resp_body.empty?
          raise NilOrEmptyResponseError
        else
          MessagePack.unpack(resp_body)
        end
      end

      def encoded_payload(method, params)
        generate_payload(method, params).to_msgpack
      end

      def generate_payload(method, params)
        {
          method:  method,
          jsonrpc: JSONRPC_VERSION,
          params:  params,
          id:      SecureRandom.base64
        }
      end

      def headers
        { 'Content-Type' => CONTENT_TYPE }
      end
    end
  end
end
