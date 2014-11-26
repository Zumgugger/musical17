class DepartmentsController < ApplicationController
  
  before_action :set_department, only: [ :show, :edit, :update, :destroy]
  def index
    @departments = Department.order(:name)
    @names = []
    @departments.each do |department| 
      @names << department.name
    end #do
  end #index

  def show
  end #show

  def new
    @department = Department.new
  end #new

  def create
    @department = Department.new(:name => 'Name')
    if @department.save
      flash[:notice] = "Ressort hinzugefügt"
      redirect_to departments_path
    else
      render 'index'
    end
  end

  def edit
  end

  def update
    if @department.update_attributes(department_params)
      flash[:notice] = "Ressort aktualisiert"
      redirect_to @department
    else
      render('edit')
    end
  end


  def destroy
    @department.destroy
    flash[:notice] = "Ressort gelöscht"
    redirect_to departments_path
  end


  private

    def department_params
      params.require(:department).permit(:parent_department_id, :name, :description)
    end
    
    def set_department
      if @department = Department.find(params[:id])
      else @department =Department.new(:name => 'Name', :description => 'Beschreibung')
      end
    end

end #class