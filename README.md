# Incognito
I was wondering if it was possible to obfuscate routes in Rails. It turns out you can!

This gem will turn your URLs such as `/posts/2/comments` into `/incognito/7289c460-6d3e-4f1a-81b9-a0d0492648c3`

## Usage
In your `routes.rb` file, add `obfuscate_<http_method>` for each path you want to obfuscate and mount the engine.  
(There might be a way to automize the obfuscation but I'm too lazy to figure out how. Feel free to submit a PR.)

```ruby
obfuscate_get :posts, to: "posts#index"
obfuscate_get :post, to: "posts#show"
obfuscate_get :new_post, to: "posts#new"
obfuscate_get :edit_post, to: "posts#edit"
obfuscate_post :posts, to: "posts#create"
obfuscate_put :post, to: "posts#update"
obfuscate_patch :post, to: "posts#update"
obfuscate_delete :post, to: "posts#destroy"

mount Incognito::Engine => "/"
```

Then in your controllers and views, update your path helpers.

```ruby
GET posts_url => obfuscated_get_posts_url
GET post_url(@post) => obfuscated_get_post_url(@post)
PATCH post_url(@post) => obfuscated_patch_post_url(@post)
```

You can change the mount location with `Incognito.mount_to = "<your mount path>"`

For example:
```ruby
# in config/initializers/incognito.rb
Incognito.mount_to = "private"
# => will generate /private/7289c460-6d3e-4f1a-81b9-a0d0492648c3 URLs
```

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
