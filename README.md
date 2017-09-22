# AVR upload

AVR upload is a frontend for `avrdude` for Linux installations with a difficult
TTY. If `avrdude` is unable to upload your hex files due to a time-out, chances
are avrupload is able to perform the upload instead.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'avrupload'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install avrupload

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://git.bietje.net/etaos/avrupload.
This project is intended to be a safe, welcoming space for collaboration,
and contributors are expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

