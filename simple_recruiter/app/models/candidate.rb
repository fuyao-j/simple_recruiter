class Candidate < ActiveRecord::Base

  enum status: {
      review: 0,
      interview: 1,
      hired: 2,
  }

  has_many :VacancyCandidate
  has_many :vacancies, through: 'VacancyCandidate'

  validates :first_name, presence: true
  validates :last_name, presence: true

end
