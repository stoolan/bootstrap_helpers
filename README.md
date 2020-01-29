# BootstrapHelpers
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'bootstrap_helpers'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install bootstrap_helpers
```

## Usage

The following Bootstrap helper functions are available:

* bootstrap_card

```erb
<%= boostrap_card(title: "A Title", subtitle: "A Subtitle", text: "Some text") %>
```

or

```erb
<%= boostrap_card(title: "A Title", subtitle: "A Subtitle") do %>
  <div class="my-custom-div">
    Render this as HTML!
  </div>
<% end%>
```

* bootstrap_alert
* bootstrap_text
* bootstrap_table
* nav_link_class
* nav_tab_link
* bootstrap_nav_tabs


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
