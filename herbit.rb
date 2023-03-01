require 'faraday'
require 'uri'
require 'faraday/net_http'
Faraday.default_adapter = :net_http

class Herbit
  def initialize(port:)
    @port = port
  end

  def run_app(cmd)
    puts "[herbit:app] #{cmd}"
    run("+hood/#{cmd}", { app: 'hood' })
  end
  
  def run_dojo(cmd)
    puts "[herbit:dojo] #{cmd}"
    run(cmd, { stdout: nil })
  end

  private

  def run(cmd, sink)
    encoded_params = URI.encode_www_form({ password: "lidlut-tabwed-pillex-ridrup" })
    response = connection.post(
        "http://localhost:#{@port}/~/login",
        encoded_params
      )
    cookie = response.headers['set-cookie']
    cookie = cookie.split(';')[0]

    response = connection.post do |req|
      req.headers['Cookie'] = cookie
      req.body = {
        source: { dojo: cmd },
        sink: sink
      }.to_json
    end
  end

  def connection
    @connection ||= Faraday.new(
      url: "http://localhost:#{@port}",
      headers: {
        Accept: "*/*",
        "Accept-Encoding": "gzip, deflate",
        Connection: "keep-alive",
        "User-Agent": "herbit/0.0.1"
      }
    )
  end
end
