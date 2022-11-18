require 'rails_helper'

RSpec.describe ServiceWidgetController do
  describe 'GET show_services' do
    it 'should return correct response and body' do
      VCR.use_cassette('clinic-cpt-codes', { record: :none }) do
        get root_path

        expect(response).to have_http_status(:ok)
        expect(response.body).to match(/Psychiatric Diagnostic Evaluation/)
        expect(response.body).to match(/Intro Call/)
      end
    end
  end

  describe 'GET show_clinics' do
    let(:service_widget) { ServiceWidget.new(id: 3866) }

    it 'should get correct response and body' do
      VCR.use_cassette('clinic-offices', { record: :none }) do
        get show_clinics_path({ service_widget: service_widget.attributes, id: service_widget.id })

        expect(response).to have_http_status(:ok)
        expect(response.body).to match(/Video Office/)
        expect(response.body).to match(/\(626\)\s298-1956/)
      end
    end
  end
end
