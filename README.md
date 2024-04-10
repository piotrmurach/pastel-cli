# Pastel CLI

[![Gem Version](https://badge.fury.io/rb/pastel-cli.svg)][gem]
[![Actions CI](https://github.com/piotrmurach/pastel-cli/actions/workflows/ci.yml/badge.svg)][gh_actions_ci]
[![Build status](https://ci.appveyor.com/api/projects/status/lqhbd9sy4rn8xdr2?svg=true)][appveyor]

[gem]: https://badge.fury.io/rb/pastel-cli
[gh_actions_ci]: https://github.com/piotrmurach/pastel-cli/actions/workflows/ci.yml
[appveyor]: https://ci.appveyor.com/project/piotrmurach/pastel-cli

> CLI tool for intuitive terminal output styling

**Pastel CLI** provides terminal tool for [Pastel](https://github.com/piotrmurach/pastel).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "pastel-cli"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pastel-cli

## Usage

To color output in green do:

```bash
$ pastel green " ✔ OK "
```

Apart from foreground color, you can also provide background and style like so:

```bash
$ pastel black bold on_green " ✔ OK "
```

It supports pipping input:

```bash
$ echo -n " ✔ OK " | pastel black bold on_green
```

To see all available styles and color names use `--styles/-s` option:

```bash
$ pastel --styles
```

This will produce the following in the terminal:

```bash
Swatch    Name
◼ pastel  bold
◼ pastel  dark
◼ pastel  dim
◼ pastel  italic
...
```

## Contributing

1. Fork it ( https://github.com/piotrmurach/pastel-cli/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Code of Conduct

Everyone interacting in the Pastel CLI project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/piotrmurach/tty-option/blob/master/CODE_OF_CONDUCT.md).

## Copyright

Copyright (c) 2016 Piotr Murach. See LICENSE for further details.
