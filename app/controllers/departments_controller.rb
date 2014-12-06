class DepartmentsController < ApplicationController
  
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  before_action :set_title
  
  def index
    @departments = Department.order(:name)
    make_collections
   end #index

  def show
    make_collections
  end #show

  def new
    @department = Department.new
  end #new

  def create
    @department = Department.new(:name => '_neues Ressort')
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
      format.html { redirect_to departments_url }
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
    
    def set_title
      if @department
         @title = 'Ressort ' + @department.name
      else @title = 'Ressorts'
      end
    end
    
    def make_collections
      @departments = Department.order(:name)
      @teachers = Teacher.all
      @parent_departments = []
      @departments.each do |d|
        @parent_departments << [d.id, d.name]
      end #do
      @parent_departments << [nil, "---"]
    end #def

end #class