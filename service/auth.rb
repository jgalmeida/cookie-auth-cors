module Sinatra
  module SessionAuth

    module Helpers

      def authenticate!
        halt 401, 'Not authenticated' unless current_user_allowed?
      end

      def current_user
        session['current_user']
      end

      def current_user_allowed?
        ['jony'].include? current_user
      end

    end

    def self.registered(app)
      app.helpers SessionAuth::Helpers
    end

  end

end