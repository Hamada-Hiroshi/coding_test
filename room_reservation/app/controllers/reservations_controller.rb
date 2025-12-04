class ReservationsController < ApplicationController
  before_action :set_meeting_room

  def index
    @reservations = @meeting_room.reservations.includes(:user)
  end

  def create
    @reservation = @meeting_room.reservations.new(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      render json: @reservation.as_json, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # NOTE: 本来は認証機能を実装してログインしているユーザーを取得
  def current_user
    User.first
  end

  def set_meeting_room
    @meeting_room = MeetingRoom.find(params[:meeting_room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_at, :end_at)
  end
end
