class Api::V1::EmployeesController < ApplicationController
  def index
    render json: Employee.includes(skills: [:languages]).all
  end

  def show
  end
end
