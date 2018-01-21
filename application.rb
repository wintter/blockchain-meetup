require 'grape'
require 'active_record'
require 'trailblazer'
require 'trailblazer/loader'
require 'reform/form/active_model/validations'
require 'yajl'
require 'pry'
require 'redis'
require 'roar/decorator'
require 'roar/json'

module API
  class Application < Grape::API
    format :json

    version :v1 do
      desc 'Get list of last blocks'
      params do
        requires :blocks_count, type: Integer, desc: 'Number of blocks.'
      end
      get('last_blocks/:blocks_count') { Blockchain::Operations::Index.call(params).to_json }

      desc 'Add new data'
      params do
        requires :data, type: String, desc: 'String for new data.'
      end
      post('add_data') do
        op = Blockchain::Operations::Create.call(params)
        op.to_json
      end
    end
  end
end

Trailblazer::Loader.new.(concepts_root: './concepts/', debug: true) { |file| require_relative(file) }

require_relative 'database'
