module Blockchain
  module Operations
    class Operations::Create < Trailblazer::Operation

      def process(params)
        @model = ::Blockchain::Builders::BlockBuilder.build do |builder|
          builder.add_rows_data(params[:data])
          builder.set_attributes
        end
        @model.save!
      end

      def to_json(*)
        ::Blockchain::Representers::BlockChainRepresenter.new(@model)
      end
    end
  end
end
