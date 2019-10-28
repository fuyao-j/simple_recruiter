# frozen_string_literal: true

class Candidate < ActiveRecord::Base
  enum status: {
    review: 0,
    interview: 1,
    hired: 2
  }

  has_many :VacancyCandidate, dependent: :destroy
  has_many :vacancies, through: 'VacancyCandidate'

  scope :search, ->(term) { where('first_name LIKE :term OR last_name LIKE :term', term: "%#{term}%") }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validate :ensure_active_vacancies

  private

  def ensure_active_vacancies
    if (vacancies.map(&:id) - Vacancy.active.pluck(:id)).present?
      errors.add :vacancies, 'Should associate only active vacancies'
    end
  end
end
