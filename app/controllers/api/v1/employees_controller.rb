class Api::V1::EmployeesController < ApplicationController
  def index
    render json: Employee.all
  end

  def show
  end
end
