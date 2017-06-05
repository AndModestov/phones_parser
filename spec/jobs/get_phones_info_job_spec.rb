require 'rails_helper'

RSpec.describe GetPhonesInfoJob do

  describe 'perform method' do
    let!(:parser){ PhoneareaParser.new('phone') }

    it 'initialize a new parser instance and gets dimentions for it' do
      expect(PhoneareaParser).to receive(:new).with('phone model').and_return(parser)
      expect(parser).to receive(:get_dimentions).and_return('awesome dimentions')

      GetPhonesInfoJob.perform_now 'phonearea', 'phone model', '123456'
    end
  end
end
