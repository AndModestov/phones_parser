require 'rails_helper'

RSpec.describe PhonesController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it 'assigns a @channel id' do
      expect(assigns(:channel)).to be_a String
    end

    it 'changes @channel id' do
      first_channel = assigns(:channel)
      get :index
      expect(assigns(:channel)).to_not eq first_channel
    end
  end

  describe 'GET #get_info' do
    it 'calls GetPhonesInfoJob' do
      expect(GetPhonesInfoJob).to receive(:perform_later).with('phonearea', 'phone_model', '123456')
      get :get_info, phones_resource: 'phonearea', keyword: 'phone_model', channel: '123456', format: :js
    end
  end
end
