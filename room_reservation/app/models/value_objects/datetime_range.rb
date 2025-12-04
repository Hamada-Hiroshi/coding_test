class DatetimeRange
  attr_reader :start_at, :end_at

  def initialize(start_at, end_at)
    @start_at = start_at
    @end_at = end_at
  end

  def valid?
    start_at.is_a?(Time) && end_at.is_a?(Time) && start_at < end_at
  end
end

