# Pastel CLI
[![Gem Version](https://badge.fury.io/rb/pastel-cli.svg)][gem]
[![Build Status](https://secure.travis-ci.org/peter-murach/pastel-cli.svg?branch=master)][travis]

[gem]: http://badge.fury.io/rb/pastel-cli
[travis]: http://travis-ci.org/peter-murach/pastel-cli

> CLI tool for intuitive terminal output styling

**Pastel CLI** provides terminal tool for [Pastel](https://github.com/peter-murach/pastel).

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

1. Fork it ( https://github.com/peter-murach/pastel-cli/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2016 Piotr Murach. See LICENSE for further details.
