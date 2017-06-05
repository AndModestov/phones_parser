require 'rails_helper'

RSpec.describe PhoneareaParser do
  let!(:parser){ PhoneareaParser.new 'superphone'}

  describe 'initialize method' do
    it 'assigns base_url and keyword' do
      expect(parser.keyword).to eq 'superphone'
      expect(parser.base_url).to eq PhoneareaParser::BASE_URL
    end
  end

  describe 'find_phones method' do
    it 'sends request to phones_search_url' do
      expected_url = parser.base_url + parser.phones_search_url
      expect(parser).to receive(:make_request).with(expected_url, :get)
      parser.find_phones
    end
  end

  describe 'find_dimentions method' do
    it 'sends request to phone_url' do
      phone_url = '/phones/superphone-12345'
      expected_url = parser.base_url + phone_url
      expect(parser).to receive(:make_request).with(expected_url, :get)
      parser.find_dimentions phone_url
    end
  end

  describe 'get_dimentions method' do
    it 'calls find_phones and find_dimentions' do
      phones_resp = ['superphone-123', 'superphone-456']
      expect(parser).to receive(:find_phones).and_return(phones_resp)
      expect(parser).to receive(:find_dimentions).with(phones_resp.first)
      parser.get_dimentions
    end
  end
end
