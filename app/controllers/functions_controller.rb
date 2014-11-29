class FunctionsController < ApplicationController
  before_action :set_function, only: [:show, :edit, :update, :destroy]
  
  def index
    @functions = Function.order(:name)
    make_collections
   end #index

  def show
    make_collections
  end #show

  def new
    @function = Function.new
  end #new

  def create
    @function = Function.new(:name => '_neue Funktion')
    respond_to do |format|
      if @function.save
        format.html { redirect_to functions_path, notice: 'Funktion hinzugefügt' }
        format.json { render action: 'index', status: :created, location: @function }
      else
        format.html { render action: 'index' }
        format.json { render json: @functions.errors, status: :unprocessable_entity }
      end #if
    end #do
  end #create

  def edit
  end

  def update
    respond_to do |format|
      if @function.update_attributes(function_params)
        format.html { redirect_to @function, :notice => 'Funktion aktualisiert' }
        format.json { head :no_content }
      else
        format.html { render :action => 'index' }
        format.json { render json: @function.errors, status: :unprocessable_entity }
      end #if
    end #do
  end #update


  def destroy
    @function.destroy
    respond_to do |format|
      format.html { redirect_to functions_url }
      format.json { head :no_content }
    end #do
  end #destroy


  private

    def function_params
      params.require(:function).permit(:id, :name, :teacher_id, :department_id)
    end #function_params
    
    def set_function
      if @function = Function.find(params[:id])
      else @function =Function.new(:name => 'Name')
      end #if
    end #set_funciton
        
    def make_collections
      @functions = Function.order(:name)
    end #make_collections
    
end #class

