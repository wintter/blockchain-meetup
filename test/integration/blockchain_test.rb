require 'test_helper'

class BlockchainIntegrationTest < Minitest::Spec
  include Rack::Test::Methods

  let (:params) { { data: 'data1' } }

  it do
    post '/v1/add_data', params.to_json
    last_response.status.must_equal 201
  end
end
