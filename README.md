# bouncer

An Urbit app desk bouncing script. This will connect to a fakezod, and run a 
script to merge, mount, rsync, commit, and install (a common workflow for app
development).

## Requirements

- Ruby 3+
- [bundler](https://bundler.io/) (`gem install bundler`)
- a fresh Urbit fake ship (currently assumes `~zod`)

## Setup

1. Check out this repo
2. Run `bundle` to install the Ruby dependencies
3. Modify the vars at the top of `sync.sh` to match the config of your system

## Usage

Start a new fakezod, then:

```sh
bin/bounce [patp] [port] # defaults to zod 12321; e.g., bin/bounce net 12322
```

## TODO

- [ ] automated removal of stale pier / creation of new pier (for now, run `./create.sh` manually)
- [ ] add support for different / multiple local fake ships (besides `~zod`)
- [ ] customizable dirs for ship, groups repo, and urbit paths
- [ ] support other app desks (currently assumes groups)