# Tokenator

This is a simple rule-based tokenizer, based on the one developed by Robert Macyntyre in 1995 for the Penn Treebank, and adapted from a script lifted from [the Treat gem](https://github.com/louismullie/treat).

It's taylored to my specific use case: I don't need part-of-speech tagging or punctuation preservation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tokenator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tokenator

## Usage

```ruby
tokenizer = Tokenator.new

tokenizer.tokenize "This? It's just a basic example!"
# => ["This", "It", "is", "just", "a", "basic", "example"]

tokenizer.tokenize "This? It's just a basic example!", {:remove_punctuation => false}
# => ["This", "?", "It", "is", "just", "a", "basic", "example", "!"]

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Amval/tokenator.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

