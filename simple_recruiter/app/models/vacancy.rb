class Vacancy < ActiveRecord::Base

  enum level: {
      junior: 0,
      middle: 1,
      senior: 2,
  }
  enum status: {
      open: 0,
      review: 1,
      close: 2,
  }

  has_many :VacancyCandidate
  has_many :candidates, through: 'VacancyCandidate'

  validates :name, presence: true
  validate :validate_date_close

  private

  def validate_date_close
    if self.date_close and self.date_close < Date.today
      errors.add :date_close, 'Date close should be greater than the current'
    end
  end

end
