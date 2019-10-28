# frozen_string_literal: true

class Vacancy < ActiveRecord::Base
  enum level: {
    junior: 0,
    middle: 1,
    senior: 2
  }
  enum status: {
    open: 0,
    review: 1,
    close: 2
  }

  has_many :VacancyCandidate, dependent: :destroy
  has_many :candidates, through: 'VacancyCandidate'

  scope :search, ->(term) { where('name LIKE ?', "%#{term}%") }
  scope :active, -> { where('status != ? AND date_close > ?', statuses[:close], Date.today) }

  validates :name, presence: true
  validate :validate_date_close

  private

  def validate_date_close
    if date_close && (date_close < Date.today)
      errors.add :date_close, 'Date close should be greater than the current'
    end
  end
end
