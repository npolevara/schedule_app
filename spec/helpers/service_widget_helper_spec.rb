require 'rails_helper'

RSpec.describe ServiceWidgetHelper, type: :helper do
  describe 'state_items helper' do
    it 'should return correct description and item for state 1' do
      expect(helper.state_items(state: 1)).to eq({ description: 'Rob gross MFT', item: '1. CLINICIAN' })
    end

    it 'should return correct description for state 2' do
      expect(helper.state_items(state: 2)).to eq({ item: '2. SELECT A SERVICE' })
    end

    it 'should return correct description for state 3' do
      expect(helper.state_items(state: 3)).to eq({ item: '3. SELECT A LOCATION' })
    end
  end

  describe 'state_color helper' do
    it 'should return correct color density for selected state' do
      expect(helper.state_color(1, 1)).to eq(800)
    end

    it 'should return correct color density for selected state' do
      expect(helper.state_color(3, 1)).to eq(800)
    end

    it 'should return correct color density for selected state' do
      expect(helper.state_color(1, 2)).to eq(200)
    end
  end
end
