class Api::V1::EmployeesController < ApplicationController
  def index
    render json: Employee.includes(:languages, skills: [:languages, :disciplines, :experiences]).all, include: ['skills', 'languages', 'disciplines', 'skills.experiences']
  end

  def show
    render json: Employee.includes(skills: [:languages, :disciplines, :experiences]).find(params[:id]), include: ['skills', 'languages', 'disciplines', 'skills.experiences']
  end
end
