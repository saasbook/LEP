class Timesheet < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :language, :presence => true, :format => /\A^[A-Z][a-z]+$\Z/
  validates :hours, :presence => true, :format => /\A^([01]?[0-9]|2[0-3])\Z/
  validates :date, :presence => true
  validate :date_cannot_be_in_future

  def date_cannot_be_in_future
    if date > Date.today
      errors[:date] << "Date cannot be in the future."
    end
  end

end
