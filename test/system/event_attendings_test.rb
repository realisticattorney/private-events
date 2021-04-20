require 'application_system_test_case'

class EventAttendingsTest < ApplicationSystemTestCase
  setup do
    @event_attending = event_attendings(:one)
  end

  test 'visiting the index' do
    visit event_attendings_url
    assert_selector 'h1', text: 'Event Attendings'
  end

  test 'creating a Event attending' do
    visit event_attendings_url
    click_on 'New Event Attending'

    click_on 'Create Event attending'

    assert_text 'Event attending was successfully created'
    click_on 'Back'
  end

  test 'updating a Event attending' do
    visit event_attendings_url
    click_on 'Edit', match: :first

    click_on 'Update Event attending'

    assert_text 'Event attending was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Event attending' do
    visit event_attendings_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Event attending was successfully destroyed'
  end
end
