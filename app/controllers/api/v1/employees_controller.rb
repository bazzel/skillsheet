class Api::V1::EmployeesController < ApplicationController
  def index
    render json: Employee.includes(skills: [ { technology: [:languages, :disciplines] }, :experiences]).all, include: ['skills', 'skills.technology', 'skills.technology.languages', 'skills.technology.disciplines', 'skills.experiences']
  end

  def show
    render json: Employee.includes(skills: [ { technology: [:languages, :disciplines] }, :experiences]).find(params[:id]), include: ['skills', 'skills.technology', 'skills.technology.languages', 'skills.technology.disciplines', 'skills.experiences']
  end
end
