class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :meeting_room

  validates :start_at, :end_at, presence: true
  validate :end_time_after_start_time
  validate :no_time_conflicts

  private

  def end_time_after_start_time
    return if end_at.blank? || start_at.blank?

    if end_at <= start_at
      errors.add(:end_at, "must be after the start time")
    end
  end

  def no_time_conflicts
    return if start_at.blank? || end_at.blank?

    overlapping_reservations = Reservation
      .where(meeting_room_id: meeting_room_id)
      .where.not(id: id)
      .where("start_at < ? AND end_at > ?", end_at, start_at)

    if overlapping_reservations.exists?
      errors.add(:base, "Time slot conflicts with an existing reservation")
    end
  end
end
