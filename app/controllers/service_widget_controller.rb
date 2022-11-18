# frozen_string_literal: true

class ServiceWidgetController < ApplicationController
  before_action :create_service, only: :show_services

  def show_services
    response = HTTParty.get(services_url, headers: headers)

    @resp = JSON.parse(response.body).deep_symbolize_keys[:data]

    respond_to { |format| format.html } 
  end

  def show_clinics
    response = HTTParty.get(clinics_url, headers: headers)
    @resp = JSON.parse(response.body).deep_symbolize_keys[:data]
    @service = ServiceWidget.new(permitted_params.merge({ id: params[:id] }))

    respond_to { |format| format.html } 
  end

  def select_location
    # //
  end

  private

  def create_service
    @service = ServiceWidget.new
  end

  def permitted_params
    params.require(:service_widget)
          .permit(:id, :description, :duration, :rate, :callToBook,
                  :requireCreditCardForNewClients, :name, :phone,
                  :isVideo, :geolocation, :isPublic)
  end

  def api_url
    'https://johnny-appleseed.clientsecure.me/client-portal-api'
  end

  def services_url
    "#{api_url}/cpt-codes?filter[clinicianId]=2"
  end

  def clinics_url
    "#{api_url}/offices?filter[clinicianId]=2&filter[cptCodeId]=#{params[:id]}"
  end

  def headers
    {
      'Accept' => 'application/vnd.api+json',
      'api-version' => '2019-01-17',
      'application-build-version' => '0.0.0',
      'application-platform' => 'web'
    }
  end
end
