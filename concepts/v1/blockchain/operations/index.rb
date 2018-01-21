module Blockchain
  module Operations
    class Operations::Index < Trailblazer::Operation
      def process(params)
        @blocks = BlockChain.last params[:blocks_count]
      end

      def to_json(*)
        @blocks.map { |b| ::Blockchain::Representers::BlockChainRepresenter.new(b) }
      end
    end
  end
end
