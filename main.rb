require_relative 'herbit'
require 'yaml'

def main
  script = YAML.load_file('script.yml')
  h = Herbit.new

  # setup phase
  for cmd in script['before'] do
    r = h.run(cmd)
    puts r.body
  end

  # sync app desk
  for cmd in script['sync'] do
    puts "[system] #{cmd}"
    system(cmd)
  end

  # commit phase
  for cmd in script['after'] do
    h.run(cmd)  
  end
end

main()
