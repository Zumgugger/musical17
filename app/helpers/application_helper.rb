module ApplicationHelper
  

      private

      def current_user
        @current_user ||= Teacher.find(session[:user_id]) if session[:user_id]
      end
      
      def admin?
        if @current_user.name == 'Markus Gugger'
          return true
        else
          false
        end
      end

end
