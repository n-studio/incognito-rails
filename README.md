# Incognito
I was wondering if it was possible to obfuscate routes in Rails. It turns out you can!

This gem will turn your URLs such as `/posts/2/comments` into `/incognito/7289c460-6d3e-4f1a-81b9-a0d0492648c3`

## Usage
In your `routes.rb` file, mount the engine and call the `obfuscate` method for each path you want to obfuscate.  
(There might be a way to automatize the obfuscation but I'm too lazy to figure out how. Feel free to submit a PR.)

```ruby
obfuscate :get, :posts, :post, :new_post, :edit_post
obfuscate :post, :posts
obfuscate :put, :post
obfuscate :patch, :post
obfuscate :delete, :post

mount Incognito::Engine => "/"
```

Then in your controllers and views, update your path helpers.

```ruby
GET posts_url => posts_url(obfuscate: { method: :get })
GET post_url(@post) => post_url(@post, obfuscate: { method: :get })
PATCH post_url(@post) => post_url(@post, obfuscate: { method: :patch })
```

You can change the mount location with `Incognito.mount_to = "<your mount path>"`

For example:
```ruby
# in config/initializers/incognito.rb
Incognito.mount_to = "private"
# => will generate /private/7289c460-6d3e-4f1a-81b9-a0d0492648c3 URLs
```

You can change the expiration time with `Incognito.default_expires_at = 2.days.from_now`

You can run the task `bin/rails incognito:cleanup` to delete all expired paths.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "incognito-rails", github: "n-studio/incognito-rails"
```

And then execute:
```bash
$ bundle
$ bin/rails incognito:install:migrations
$ bin/rails db:migrate
```

## Contributing
Feel free to fork and submit PRs.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
