class MainController < ApplicationController
  def index
    @departments = Department.all
  end
end
