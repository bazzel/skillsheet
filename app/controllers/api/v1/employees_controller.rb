class Api::V1::EmployeesController < ApplicationController
  def index
    render json: Employee.includes(:languages, skills: [:languages, :disciplines]).all, include: ['skills', 'languages', 'disciplines']
  end

  def show
    render json: Employee.includes(skills: [:languages, :disciplines]).find(params[:id]), include: ['skills', 'languages', 'disciplines']
  end
end
