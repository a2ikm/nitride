# Nitride

Nitride introduces filter-chain to enumerable objects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nitride'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nitride

## Usage

    class MemberCollection
      include Nitride

      def initialize
        @members = []
      end

      def add(member)
        @members |= member
      end

      # NOTE: Must implement `each` method.
      def each(&block)
        if block_given?
          @members.each(&block)
        else
          @members.each
        end
      end
    end

    collection = MemberCollection.new

    # add members ...

    collection.select(&:male?).reject(&:smoker?).to_a


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/a2ikm/nitride.

