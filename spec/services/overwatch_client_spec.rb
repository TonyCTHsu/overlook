require 'rails_helper'

describe OverwatchClient do
  describe '#get' do
    it 'sends a GET request with params and returns a response' do
      stub_request(:get, /overwatch/).and_return(status: 200, body: { 'id' => 1 }.to_json)
      client = described_class.new

      result = client.get('path')

      expect(result.status).to eq(200)
      expect(result.body[:id]).to eq(1)
      expect(WebMock).to have_requested(:get, 'https://overwatch-api.net/api/v1/path')
    end

    it 'retries when timeout' do
      stub_request(:get, /overwatch/).to_timeout.then.to_return(status: 200)
      client = described_class.new

      result = client.get('path')

      expect(result.status).to eq(200)
      expect(WebMock).to have_requested(:get, 'https://overwatch-api.net/api/v1/path').twice
    end

    it 'raises error after 3 retries' do
      stub_request(:get, /overwatch/).to_timeout
      client = described_class.new

      expect do
        client.get('path')
      end.to raise_error Faraday::ConnectionFailed

      expect(WebMock).to have_requested(:get, 'https://overwatch-api.net/api/v1/path').times(4)
    end
  end
end
