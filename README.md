# Remetric

Remetric tracks your user data in a snap!

This gem interacts with our API.

## Installation

Add this line to your application's Gemfile:

    gem 'remetric'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install remetric

## Usage

`Key` is always required!

```
r = Remetric.new "YOURAPIKEYGOESHERE"

data = { 
  description: "{{ contact.name }} signed up for {{ product }}.",
  product: "Remetric.com",
  contact: {
    key: "dallas",
    name: "Dallas Read"
  },
  redirect: "http://www.remetric.com" # See below (Hint: only used with "r.redirect")
}

json_response = r.track data # Just save the data
tracking_img = r.img data # Render a tracking image
redirect_link = r.redirect data # Generate a tracking link that redirects somewhere
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
