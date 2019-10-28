# frozen_string_literal: true

class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[show update destroy edit]

  def index
    search = params.permit(:term)
    @candidates = search.present? ? Candidate.search(search[:term]) : Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit; end

  def show; end

  def update
    if @candidate.update_attributes(candidate_params)
      flash[:notice] = l(:notice_successful_update)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    begin
      Candidate.find(params[:id]).destroy
    rescue StandardError
      flash[:error] = l(:error_unable_delete_vacancy)
    end
    flash[:notice] = l(:notice_successful_delete)
    redirect_to action: :index
  end

  private

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :position, :status, vacancy_ids: [])
  end

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end
end
