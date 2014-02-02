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
r = Remetric.new "#{remetric_api_token}"

r.track "{{ name }} signed in with {{ email }}.", { 
  key: user.id, 
  email: user.email, 
  name: user.name, 
  last_sign_in: Time.now.to_i, 
  comments: user.comments.count
}

r.save_contact({ 
  key: user.id, 
  email: user.email, 
  name: user.name
})
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
