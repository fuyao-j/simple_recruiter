# frozen_string_literal: true

class VacanciesController < ApplicationController
  before_action :set_vacancy, only: %i[show update destroy edit]

  def index
    search = params.permit(:term)
    @vacancies = search.present? ? Vacancy.search(search[:term]) : Vacancy.all
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    if @vacancy.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit; end

  def show; end

  def update
    if @vacancy.update_attributes(vacancy_params)
      flash[:notice] = l(:notice_successful_update)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    begin
      Vacancy.find(params[:id]).destroy
    rescue StandardError
      flash[:error] = l(:error_unable_delete_vacancy)
    end
    flash[:notice] = l(:notice_successful_delete)
    redirect_to action: :index
  end

  private

  def vacancy_params
    params.require(:vacancy).permit(:name, :level, :status, :date_close, candidate_ids: [])
  end

  def set_vacancy
    @vacancy = Vacancy.find(params[:id])
  end
end
