Rails.application.routes.draw do

  root "service_widget#show_services"

  get 'show_clinics/:id', to: "service_widget#show_clinics", as: 'show_clinics'
  get 'select_location/:id', to: "service_widget#select_location", as: 'select_location'

end
