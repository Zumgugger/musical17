class SessionsController < ApplicationController
  
  before_action :set_title
  
     def new
       session[:return_to] ||= request.referer
     end
     
     def create
      session[:return_to] ||= request.referer
      user = Teacher.find_by_email(params[:email])
       if user && user.authenticate(params[:password])
         session[:user_id] = user.id
         redirect_to session[:return_to], :notice => "Logged in!"
       else
         flash.now.alert = "Falsche E-Mail or falsches Passwort"
         render "new"
       end
     end
     
     def destroy
       session[:return_to] ||= request.referer
       session[:user_id] = nil
       redirect_to session[:return_to], :notice => "Logged out!"
     end #destroy
     
  private
  
    def set_title
      @title = "Login"
    end
end #class 