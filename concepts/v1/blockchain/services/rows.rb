module Blockchain
  module Services
    class Rows
      include Singleton
      attr_reader :connection
      KEY = 'rows'.freeze

      def initialize
        @connection = Redis.new
      end

      def put(value)
        connection.set KEY, prepare_data(value)
      end

      def hash_data
        data.last(5)
      end

      private

      def prepare_data(value)
        (data << value).to_json
      end

      def data
        JSON.parse connection.get(KEY) || []
      end
    end
  end
end
