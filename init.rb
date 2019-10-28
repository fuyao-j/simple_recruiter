Redmine::Plugin.register :simple_recruiter do
  name 'Simple Recruiter plugin'
  author 'Nickolay Marchuk'
  description "This is a plugin for helps HR with recruitment"
  version '0.0.1'
  url 'https://github.com/mr-proxyz/simle_recruiter'
  author_url 'https://github.com/mr-proxyz'

  menu :application_menu, :vacancies, { controller: 'vacancies', action: 'index' }, caption: 'Vacancies'
  menu :application_menu, :candidates, { controller: 'candidates', action: 'index' }, caption: 'Candidates'
end
