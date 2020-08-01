# Pastel CLI

[![Gem Version](https://badge.fury.io/rb/pastel-cli.svg)][gem]
[![Build Status](https://secure.travis-ci.org/piotrmurach/pastel-cli.svg?branch=master)][travis]
[![Build status](https://ci.appveyor.com/api/projects/status/lqhbd9sy4rn8xdr2?svg=true)][appveyor]

[gem]: http://badge.fury.io/rb/pastel-cli
[travis]: http://travis-ci.org/piotrmurach/pastel-cli
[appveyor]: https://ci.appveyor.com/project/piotrmurach/pastel-cli

> CLI tool for intuitive terminal output styling

**Pastel CLI** provides terminal tool for [Pastel](https://github.com/piotrmurach/pastel).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pastel-cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pastel-cli

## Usage

To color output in green issue the command:

```bash
$ pastel green 'Unicorns & rainbows!'
```

You can also provide more than one styling option:

```bash
$ pastel green on_red bold 'Unicorns & rainbows!'
```

Pipe input:

```bash
$ echo 'Unicorns & rainbows!' | pastel green
```

## Contributing

1. Fork it ( https://github.com/piotrmurach/pastel-cli/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2016-2017 Piotr Murach. See LICENSE for further details.
