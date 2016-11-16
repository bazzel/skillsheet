class Api::V1::EmployeesController < ApplicationController
  def index
    render json: Employee.includes(:languages, skills: [:languages]).all,  include: ['skills']
  end

  def show
    render json: Employee.includes(skills: [:languages]).find(params[:id]), include: ['skills']
  end
end
