require_relative 'herbit'
require 'yaml'

DEFAULT_SCRIPT = 'script.yml'.freeze
SHIP = ARGV[0] || 'zod'

def main(script = DEFAULT_SCRIPT)
  script = YAML.load_file(script)
  h = Herbit.new

  # remove old pier, create new one
  # TODO: create a new ship in separate process? need to wait for it to finish
  # for cmd in script['init'] do
  #   puts "[system] #{cmd}"
  #   system(cmd)
  # end

  # merge & mount phase
  for cmd in script['merge'] do
    h.run_app(cmd)
  end

  for cmd in script['mount'] do
    h.run_app(cmd)
  end

  # sync app desk
  for cmd in script['sync'] do
    puts "[system] #{cmd}"
    system(cmd)
  end

  # commit & install phase
  for cmd in script['commit'] do
    h.run_app(cmd)  
  end

  for cmd in script['install'] do
    h.run_app(cmd)  
  end
end

main()
