require 'spec_helper'

describe MessagePack::JSONRPC::HTTPClient do

  # Mock out responses
  let!(:response_class) { HTTParty::Response }
  let!(:response_instance) { instance_double(response_class.to_s) }
  let!(:response_mocks) {
      allow(response_instance).to receive(:body).and_return(response_body)
      allow(described_class).to receive(:post).and_return(response_instance)
  }

  let(:endpoint) { 'http://localhost:5555/test_rpc_endpoint' }
  let(:instance) { described_class.new(endpoint) }

  describe "remote procedure calls" do

    describe "when response body is not-nil" do
      let(:unencoded_body) { 
        { "sample_return_value" => 5 }
      }
      let(:response_body){
        unencoded_body.to_msgpack
      }

      it 'will return correct response' do
        expect(instance.remote_call(:test)).to eql(unencoded_body)
      end
    end

    describe "when response body is nil" do
      let(:response_body) { nil }

      it 'will raise an error' do
        expect { instance.remote_call(:test) }.to raise_error(
          ::MessagePack::JSONRPC::HTTPClient::NilOrEmptyResponseError
        )
      end
    end
  
  end
end
