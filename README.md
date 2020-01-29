# Bootstrap Helpers
Just some wrappers to help generate commonly used bootstrap structures.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'bootstrap_helpers', git: 'https://github.com/stoolan/bootstrap_helpers.git'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install https://github.com/stoolan/bootstrap_helpers.git
```

## Usage

### Generators

Use the following command to add gems 

```bash
rails g boostrap
```

### Helpers

The following Bootstrap helper functions are available:

* `bootstrap_card`

```erb
<%= boostrap_card(title: "A Title", subtitle: "A Subtitle", text: "Some text") %>

# or

<%= boostrap_card(title: "A Title", subtitle: "A Subtitle") do %>
  <div class="my-custom-div">
    Render this as HTML!
  </div>
<% end%>
```

* `bootstrap_alert`


```erb
<%= bootstrap_alert(class: "danger") do %>
  <h1> Important Alert! </h1>
<% end %>

# or

<%= bootstrap_alert(class: "danger", text: "An alert!") %>

```

* `bootstrap_text`
* `bootstrap_table`
* `nav_link_class`
* `nav_tab_link`
* `bootstrap_nav_tabs`


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
