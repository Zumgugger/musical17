class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :set_title
  
  def index
    @assignments = Assignment.all
    make_collections
   end #index

  def show
    make_collections
  end #show

  def new
    @assignment = Assignment.new
  end #new

  def create
    @assignment = Assignment.new
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to assignments_path, notice: 'Funktion hinzugefügt' }
        format.json { render action: 'index', status: :created, location: @assignment }
      else
        format.html { render action: 'index' }
        format.json { render json: @assignments.errors, status: :unprocessable_entity }
      end #if
    end #do
  end #create

  def edit
  end

  def update
    respond_to do |format|
      if @assignment.update_attributes(assignment_params)
        format.html { redirect_to @assignment, :notice => 'Funktion aktualisiert' }
        format.json { head :no_content }
      else
        format.html { render :action => 'index' }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end #if
    end #do
  end #update


  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url }
      format.json { head :no_content }
    end #do
  end #destroy


  private

    def assignment_params
      params.require(:assignment).permit(:name, :text, :department_id, :responsibility?, :competence?, :deadline)
    end #assignment_params
    
    def set_assignment
      if @assignment = Assignment.find(params[:id])
      else @assignment =Assignment.new
      end #if
    end #set_funciton
    
    def set_title
      if @assignment
         @title = @assignment.name
      else @title = 'Aufgaben'
      end
    end
        
    def make_collections
      @assignments = Assignment.all
      departments = Department.all
      @collection = []
      departments.each do |d|
         @collection << [d.id, d.name]
      end #do
      @collection << [nil, "noch nicht zugeteilt"]
      @checkbox = ["Nein", "Ja"]
    end #make_collections
    
end #class

