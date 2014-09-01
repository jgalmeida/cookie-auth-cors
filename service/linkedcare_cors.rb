class LinkedcareCors

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    headers.merge!(cors_headers)

    [status, headers, body]
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