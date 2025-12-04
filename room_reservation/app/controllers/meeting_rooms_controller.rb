class MeetingRoomsController < ApplicationController
  def index
    @meeting_rooms = MeetingRoom.all

    render json: @meeting_rooms.as_json
  end
end
