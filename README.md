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
3. Create a copy of `config.yml` and add your own script and ENV vars. See `./apps/landscape/config.yml` for an example

## Usage

Start a new fakezod, then:

```sh
bin/bounce -c ./apps/landscape/config.yml
```

Or for a ship besides `~zod` running on another loopback port:
```
bin/bounce -c ./apps/landscape/config.yml -s net -p 12322
```

To find the loopback port, check the fake ship output for the following line:
```
http: loopback live on http://localhost:12322
```

## TODO

- [ ] automated removal of stale pier / creation of new pier (for now, run `./create.sh` manually)

