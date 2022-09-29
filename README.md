# bouncer

A dev tool to streamline Urbit app development. `bouncer` connects to a [fake ship](https://developers.urbit.org/guides/core/environment#creating-a-fake-ship) and runs a customizable script to merge, mount, rsync, commit, and install (a common workflow for app development).

## Requirements

- Ruby 3+
- [bundler](https://bundler.io/) (`gem install bundler`)
- a fresh Urbit fake ship (currently assumes `~zod`)

## Setup

1. Check out this repo
2. Run `bundle` to install the Ruby dependencies
3. Create a copy of `config.yml` and add your own script and ENV vars. See `./apps/landscape/config.yml` for an example

## Usage

For a quick demo, start a new fake `~zod` and then:
```
bin/bounce
```

To use a custom config:
```
bin/bounce -c ./apps/landscape/config.yml
```

Or for a ship besides `~zod` running on another loopback port (ie, running multiple ships):
```
bin/bounce -c ./apps/landscape/config.yml -s net -p 12322
```

The custom config syntax is documented in `config.yml`.

To find the loopback port, check the fake ship output for the following line:
```
http: loopback live on http://localhost:12322
```

## TODO

- [ ] automated removal of stale pier / creation of new pier (for now, run `./create.sh` manually)

