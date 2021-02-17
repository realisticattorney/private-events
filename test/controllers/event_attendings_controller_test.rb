require 'test_helper'

class EventAttendingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_attending = event_attendings(:one)
  end

  test "should get index" do
    get event_attendings_url
    assert_response :success
  end

  test "should get new" do
    get new_event_attending_url
    assert_response :success
  end

  test "should create event_attending" do
    assert_difference('EventAttending.count') do
      post event_attendings_url, params: { event_attending: {  } }
    end

    assert_redirected_to event_attending_url(EventAttending.last)
  end

  test "should show event_attending" do
    get event_attending_url(@event_attending)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_attending_url(@event_attending)
    assert_response :success
  end

  test "should update event_attending" do
    patch event_attending_url(@event_attending), params: { event_attending: {  } }
    assert_redirected_to event_attending_url(@event_attending)
  end

  test "should destroy event_attending" do
    assert_difference('EventAttending.count', -1) do
      delete event_attending_url(@event_attending)
    end

    assert_redirected_to event_attendings_url
  end
end
