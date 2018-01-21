require 'active_record'

class BlockChain < ActiveRecord::Base
  class << self
    alias previous last
  end

  def timestamp
    created_at.to_i
  end
end

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'blockchain_meetup'
)

ActiveRecord::Schema.define do
  create_table :block_chains do |table|
    table.column :previous_block_hash, :text
    table.column :rows, :text, array: true, default: []
    table.column :block_hash, :text
    table.timestamps
  end unless ActiveRecord::Base.connection.table_exists? 'block_chains'
end
