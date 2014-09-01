class LinkedcareCors

  def initialize(app)
    @app = app
  end

  def call(env)
    if env['REQUEST_METHOD'] == 'OPTIONS'
      return [200, { 'Content-Type' => 'text/plain' }.merge(cors_headers), nil]
    else
      status, headers, body = @app.call(env)

      headers.merge!(cors_headers)

      [status, headers, body]
    end
  end

  def cors_headers
    {
      'Access-Control-Allow-Origin'      => ['http://corsauth.com:1337'],
      'Access-Control-Allow-Methods'     => ['POST'],
      'Access-Control-Max-Age'           => '1932942424',
      'Access-Control-Allow-Credentials' => 'true'
    }
  end

end