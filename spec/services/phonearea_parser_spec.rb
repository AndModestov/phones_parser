require 'rails_helper'

RSpec.describe PhoneareaParser do

  describe 'initialize method' do
    it 'assigns base_url and keyword' do
      parser = PhoneareaParser.new 'samsung'
      expect(parser.keyword).to eq 'samsung'
      expect(parser.base_url).to eq PhoneareaParser::BASE_URL
    end
  end
end
