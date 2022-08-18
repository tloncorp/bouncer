require 'faraday'
require 'faraday/net_http'
Faraday.default_adapter = :net_http

DEFAULT_PORT = 12321.freeze

class Herbit
  def initialize(port: DEFAULT_PORT)
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
    connection.post do |req|
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
