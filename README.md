# Rapier

This gem can be used to bootstrap a Ruby gem wrapper for your (or someone else's) API.
Usually, most services open their API to the public with no Ruby gem wrapper for it. If you wanted to use their API,
you would either wait for someone to do it, or do it yourself.

If you want to go the DIY route, then this gem is for you!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rapier'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rapier

## Usage

To start, create your gem first (this example uses bundler) by executing:

`bundle gem <gem name>`

`cd` to your gem's folder and from there, you can start using rapier to assist you in making your gem.

### Setting up

To start, just execute:

`rapier start http://somesite.com/v1/api`

This creates a config file in your current folder (hopefully you did this while in your project folder) named `.rapier.yml` and also inserts the dependencies in your project gemspec.

Rapier isn't included in the dependencies but [httparty](https://github.com/jnunemaker/httparty) and [thor](https://github.com/erikhuda/thor) are.

### Adding an API endpoint

Say you are creating a gem for a site that sells products. Given this API endpoint:

    http://somesite.com/

You can do:

`rapier endpoint products`

and it will generate a simple bootstrap of files that will get you started in making your API wrapper.

This creates a file in `lib/yourgemname/products.rb` which just contains:

````
module YourGemName
  module Product
    include HTTParty
    base_uri "somesite.com"
    
    def self.products
      get('/products')
    end
  end
end
````

#### Adding endpoints with arguments

If your endpoint has arguments, like `somesite.com/products/4`, you can add the argument/s after the command like so:

Examples:

`rapier endpoint products id`

`rapier endpoint products id quantity`

This just creates the same class but with additional provisions for the arguments:

````
module YourGemName
  module Product
    include HTTParty
    base_uri "somesite.com"
    
    def initialize(id=nil, quantity=nil)
      if id || quantity
	     @options = {query: {id: id, quantity: quantity}}
	   end
    end
    
    def self.products
      get('/products', @options)
    end
  end
end
````

### Adding multiple endpoints

You can also add multiple `GET` endpoints via the `endpoints` command:

`rapier endpoints posts authors comments`

This is just a convenience call instead of calling `rapier endpoint` for each of the three endpoints.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rapier/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
