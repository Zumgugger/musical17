class TeachersController < ApplicationController
  
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :set_title
  
  def index
    @teachers = Teacher.order(:last_name)
    make_collections
   end #index

  def show
    make_collections
  end #show

  def new
    @teacher = Teacher.new
  end #new

  def create
    @teacher = Teacher.new(:last_name => '_Nachname', :first_name => '_Vorname')
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teachers_path, notice: 'Lehrer hinzugefügt' }
        format.json { render action: 'index', status: :created, location: @teacher }
      else
        format.html { render action: 'index' }
        format.json { render json: @teachers.errors, status: :unprocessable_entity }
      end #if
    end #do
  end #create

  def edit
  end

  def update
    respond_to do |format|
      if @teacher.update_attributes(teacher_params)
        format.html { redirect_to @teacher, :notice => 'Ressort aktualisiert' }
        format.json { head :no_content }
      else
        format.html { render :action => 'index' }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end #if
    end #do
  end #update


  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url }
      format.json { head :no_content }
    end #do
  end #destroy


  private

    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :email, :phone, :phone2, 
                                      :email_secret, :phone_secret, :phone_secret2,
                                      :token, :description,
                                      function_attributes: [:id, :name])
    end #teacher_params
    
    def set_teacher
      if @teacher = Teacher.find(params[:id])
      else @teacher =Teacher.new(:name => 'Name', :description => 'Beschreibung')
      end #if
    end #set_teacher
    
    def set_title
      if @teacher
         @title = @teacher.first_name + @teacher.last_name || 'Lehrer'
      else @title = 'Lehrer'
      end
    end
    
    def make_collections
      @teachers = Teacher.order(:last_name)
      @departments = Department.all
      @functions = Function.all
      @checkbox = ["(wird angezeigt)", "(wird verborgen)"]
    end
end
