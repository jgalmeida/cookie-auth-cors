module Sinatra
  module SessionAuth

    module Helpers

    end

    def self.registered(app)
      app.helpers SessionAuth::Helpers
    end

  end

end