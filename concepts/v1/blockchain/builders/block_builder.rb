module Blockchain
  module Builders
    class BlockBuilder
      attr_reader :rows_instance, :block
      delegate :hash_data, to: :rows_instance

      class << self
        def build
          builder = new
          yield builder
          builder.block
        end
      end

      def initialize
        @rows_instance = ::Blockchain::Services::Rows.instance
        @block = BlockChain.new
      end

      def add_rows_data(data)
        rows_instance.put data
      end

      def set_attributes
        set_previous_block_hash
        set_rows
        set_timestamp
        set_block_hash
      end

      private

      def set_previous_block_hash
        @block.previous_block_hash = previous_block_hash
      end

      def set_rows
        @block.rows = hash_data
      end

      def set_timestamp
        @block.created_at = Time.current
      end

      def set_block_hash
        @block.block_hash = generate_block_hash
      end

      def generate_block_hash
        Digest::SHA256.hexdigest "#{@block.previous_block_hash}#{@block.rows.sum}#{@block.created_at}"
      end

      def previous_block
        BlockChain.previous
      end

      def previous_block_hash
        previous_block&.block_hash || '0'
      end
    end
  end
end

