# frozen_string_literal: true

class ServiceWidget
  include ActiveModel::Model
  attr_accessor :id, :description, :duration, :rate, :callToBook, :requireCreditCardForNewClients

  def attributes
    keys = %i[id description duration rate callToBook requireCreditCardForNewClients]
    keys.each_with_object({}) do |i, acc|
      acc[i] = send i
    end
  end
end
