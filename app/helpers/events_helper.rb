module EventsHelper
  def enrollment_button(event)
    if current_user
      if event.host == current_user
        link_to 'You created this event. View analytics', event_path(event)
      elsif event.enrollments.where(user: current_user).any?
        link_to 'You enrolled this event', event_path(event)
      else
        link_to 'Free', new_enrollment_path(event), class: 'btn btn-success'
      end
    end
  end
end
