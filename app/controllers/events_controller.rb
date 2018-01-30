class EventsController < ApplicationController
  protect_from_forgery :except => [:event]

  def event
    @events = Balance.where(user_id: current_user.id)
    @events.each do |e|
      if e.result
        e.title = "+" + e.title
      else
        e.title = "-" + e.title
      end
    end
    respond_to do |format|
      format.json {
        render json:
        @events.to_json(
          only: [:id, :title, :start, :end, :allDay]
        )
      }
    end
  end
end
