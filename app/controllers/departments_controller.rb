class DepartmentsController < ApplicationController
  
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  def index
    @departments = Department.order(:name)
    make_collections
    @department = Department.new
   end #index

  def show
  end #show

  def new
    @department = Department.new
  end #new

  def create
    @department = Department.new(:name => 'z new Department z')
    respond_to do |format|
      if @department.save
        format.html { redirect_to departments_path, notice: 'Ressort hinzugefügt' }
        format.json { render action: 'index', status: :created, location: @department }
      else
        format.html { render action: 'index' }
        format.json { render json: @departments.errors, status: :unprocessable_entity }
      end #if
    end #do
  end #create

  def edit
  end

  def update
    respond_to do |format|
      if @department.update_attributes(department_params)
        format.html { redirect_to @department, :notice => 'Ressort aktualisiert' }
        format.json { head :no_content }
      else
        format.html { render :action => 'index' }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end #if
    end #do
  end #update


  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to actors_url }
      format.json { head :no_content }
    end #do
  end #destroy


  private

    def department_params
      params.require(:department).permit(:parent_department_id, :name, :description)
    end #def
    
    def set_department
      if @department = Department.find(params[:id])
      else @department =Department.new(:name => 'Name', :description => 'Beschreibung')
      end #if
    end #def
    
    def make_collections
      parent_departments = Department.all.order(:name)
      @parent_departments = []
      parent_departments.each do |d|
        @parent_departments << [d.id, d.name]
      end #do
    end #def

end #class