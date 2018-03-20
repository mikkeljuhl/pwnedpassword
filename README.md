# HIBP Password Checker

This gem uses `https://api.pwnedpasswords.com`.

It sends the first 5 characters of the sha1 of the password provided to https://api.pwnedpasswords.com. The response is then a list of colliding SHA1'ed passwords. We then compare the returned SHA1'ed passwords, with the provided password. This way the password nor its entire SHA1 is ever broadcast. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hibp_password_checker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hibp_password_checker

## Usage

Simple to use: `HIBPPasswordChecker.pwned?("3WJwP#cnFoUQ.9oPpc2Taivvgea+Qz2*egY")`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pwnedpassword. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Pwnedpassword project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mikkeljuhl/pwnedpassword/blob/master/CODE_OF_CONDUCT.md).
