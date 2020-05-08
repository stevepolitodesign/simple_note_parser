# SimpleNoteParser

Organizes exported [Simplenote](https://app.simplenote.com/) data into directories based on the note's tag.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_note_parser'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install simple_note_parser

## Usage

1. Export data from [Simplenote](https://simplenote.com/help/#export).
1. Unzip the file.
1. Open a new terminal window and change directories by navigating into the unzipped directory.
1. Run `gem install simple_note_parser`
1. Run `bin/console`. When the prompt opens, run the following:

```ruby
@notes = SimpleNoteParser.new
@notes.import
```

This will create a directory called `organized-by-tag` in the current directory containing directories based on each note's tag.

1. Optionally run `@notes.import` to recursively remove the `organized-by-tag` directory.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/stevepolitodesign/simple_note_parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
