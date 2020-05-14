# SimpleNoteParser

Organizes and parse exported [Simplenote](https://app.simplenote.com/) data.

- Organize notes into directories based on the note's tag.
- Merge notes into a `csv` file.

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
1. Run `gem install simple_note_parser`.
1. Run `irb` to start a new Ruby session. Once the prompt starts, run `require "simple_note_parser"`.

Once you complete these steps, you can use `SimpleNoteParser::Organizer` or organize notes, or `SimpleNoteParser::Processor` to create a `csv` from the notes.

### SimpleNoteParser::Organizer

Organizes notes into directories based on the note's tag.

```ruby
SimpleNoteParser::Organizer.new(file: "./source/notes.json", destination: "./dist/organized-by-tags")
```

- Requires a `file` value. This is the `JSON` file exported by SimpleNote.
  - Defaults to `./source/notes.json`.
- Requires a `destination` value. This is where the directories will be created.
  - Defaults to `./dist/organized-by-tags`.

#### Usage

This will create a directory called `organized-by-tag` in the current directory which will contain additional directories based on each note's tag.

```console
> @notes = SimpleNoteParser::Organizer.new
> @notes.organize_by_tag
```

Optionally run `@notes.clean` to recursively remove the `organized-by-tag` directory.

### SimpleNoteParser::Processor

Merge notes into a `csv` file.

```ruby
SimpleNoteParser::Processor.new(file: "./source/notes.json", destination: "./dist", headers: %w[title content tags])
```

- Requires a `file` value. This is the `JSON` file exported by SimpleNote.
  - Defaults to `./source/notes.json`.
- Requires a `destination` value. This is where the `csv` will be created.
  - Defaults to `./dist`.
- Requires a `headers` value. This will be used as the header row in the `csv`.
  - Defaults to `["title", "content", "tags"]`.

#### Usage

This will create a `csv` of notes called `notes.csv` in the destination directory.

```console
> @notes = SimpleNoteParser::Processor.new
> @notes.save_as_csv
```

Optionally run `@notes.clean` to remove the destination directory and `csv`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/stevepolitodesign/simple_note_parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
