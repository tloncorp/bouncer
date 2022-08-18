require 'faraday'
require 'faraday/net_http'
Faraday.default_adapter = :net_http

DEFAULT_PORT = 12321.freeze

class Herbit
  def initialize(port: DEFAULT_PORT)
    @port = port
  end

  def run(cmd)
    puts "[herbit] #{cmd}"
    connection.post do |req|
      req.body = {
        source: { dojo: cmd },
        sink: { stdout: nil }
      }.to_json
    end
  end

  private

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
