module Blockchain
  module Representers
    class BlockChainRepresenter < Roar::Decorator
      include Roar::JSON

      property :previous_block_hash
      property :rows
      property :block_hash
      property :timestamp
    end
  end
end
