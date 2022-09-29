require_relative 'herbit'
require 'optparse'
require 'yaml'

DEFAULT_CONFIG = 'config.yml'.freeze
DEFAULT_SHIP = 'zod'
DEFAULT_PORT = 12321

def parse_options
  options = { config: nil, port: nil, ship: nil }

  parser = OptionParser.new do|opts|
    opts.banner = "Bounce a local Urbit ship's desk\n\nUsage: bouncer [options]"
  
    opts.on('-c', '--config config', 'Path to config yaml (default: config.yml)') do |config|
      options[:config] = config;
    end
  
    opts.on('-p', '--port port', 'Loopback port of local ship (default: 12321)') do |port|
      options[:port] = port;
    end
  
    opts.on('-s', '--ship ship', 'Patp of local ship (default: zod)') do |ship|
      options[:ship] = ship;
    end
  
    opts.on('-h', '--help', 'Displays Help') do
      puts opts
      exit
    end
  end

  parser.parse!

  options[:config] ||= DEFAULT_CONFIG
  options[:port] ||= DEFAULT_PORT
  options[:ship] ||= DEFAULT_SHIP

  options
end

def run_system(ship:, port:, cmd:, env:)
  puts "[system] #{cmd}"
  envs = ''
  env.each {|k, v| envs << "#{k.upcase}=#{v} "}
  system("SHIP=#{ship} PORT=#{port} #{envs} #{cmd}") 
end

def bounce(options)
  config = YAML.load_file(options[:config])
  port = options[:port]
  ship = options[:ship]
  h = Herbit.new(port: port)

  puts "bouncing #{ship} on port #{port} ..."

  for phase in config['script'] do
    puts "[phase:#{phase.keys.first}]"
    for commands in phase.values do
      for cmd in commands do
        case cmd['type']
        when 'system'
          run_system(ship: ship, port: port, cmd: cmd['cmd'], env: config['env'])
        when 'urbit:app'
          h.run_app(cmd['cmd'])
        when 'urbit:dojo'
          h.run_dojo(cmd['cmd'])
        else
          puts "should not get here, check the script"
        end            
      end
    end
  end
end

def main()
  bounce(parse_options)
end

main()
