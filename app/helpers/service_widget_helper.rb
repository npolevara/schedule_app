# frozen_string_literal: true

module ServiceWidgetHelper
  def state_items(state:)
    case state
    when 1
      { item: '1. clinician'.upcase, description: 'Rob gross MFT' }
    when 2
      { item: '2. select a service'.upcase }
    when 3
      { item: '3. select a location'.upcase }
    when 4
      { item: '4. select date & time'.upcase }
    when 5
      { item: '5. your information'.upcase }
    else
      {}
    end
  end

  def state_color(state, actual_state)
    state >= actual_state ? 800 : 200
  end
end
