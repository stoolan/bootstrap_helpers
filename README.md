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

### Generators (optional)

Use the following command to add gems, scss imports, update webpacks, to make bootstrap available in your application

```bash
rails g bootstrap
```

use this generator to optionally install fontawesome css deps.

```bash
rails g fontawesome
```

### Helpers

The following Bootstrap helper functions are available:

* **bootstrap_card**
https://getbootstrap.com/docs/4.3/components/card/

```erb
<%= bootstrap_card(title: "A Title", subtitle: "A Subtitle", text: "Some text") %>
# yields

<div class="card">
  <div class="card-body">
    <h3 class="card-title">A Title</h3>
    <h4 class="card-subtitle mb-2 text-muted">A Subtitle</h4>
    <div class="card-text">Some text</div>
  </div>
</div>

# or

<%= bootstrap_card(title: "A Title", subtitle: "A Subtitle") do %>
  <div class="my-custom-div">
    Render this as HTML!
  </div>
<% end%>

# yields

<div class="card">
  <div class="card-body">
    <h3 class="card-title">A Title</h3>
    <h4 class="card-subtitle mb-2 text-muted">A Subtitle</h4>
    <div class="card-text">
      <div class="my-custom-div">
        Render this as HTML!
      </div>
    </div>
  </div>
</div>
```

* **bootstrap_alert**
https://getbootstrap.com/docs/4.0/components/alerts/

```erb
<%= bootstrap_alert(class: "danger") do %>
  <h1> Important Alert! </h1>
<% end %>

# yields

<div class="alert alert-danger" role="alert">
  <h1> Important Alert! </h1>
</div>

# or

<%= bootstrap_alert(class: "success", text: "An alert!") %>

# yields


<div class="alert alert-success" role="alert">
  An alert!
</div>
```

* **bootstrap_text**
https://getbootstrap.com/docs/4.0/utilities/colors/

```erb
<%= bootstrap_text(class: "info") do %>
  Info!
<% end %>

# yields

<p class="text text-info">
  Info!
</p>

# or

<%= bootstrap_text(class: "success", text: "Success message") %>

# yields

<p class="text text-success">
  Success message
</p>

```

* **bootstrap_table**
https://getbootstrap.com/docs/4.0/content/tables/

```erb
<%= bootstrap_table(headers: ["A", "B", "C",], rows: [[1, 2, 3], [4, 5, 6]]) %>

# yields

<table class="table table-striped">
  <thead>
    <tr>
      <th>A</th>
      <th>B</th>
      <th>C</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <td>4</td>
      <td>5</td>
      <td>6</td>
    </tr>
  </tbody>
</table>

# or

<%= bootstrap_table(headers: ["A", "B", "C",]) do %>
  <% [[1, 2, 3], [4, 5, 6]].each do |row| %>
    <tr>
      <% row.each do |cell| %>
        <td>
          <%= cell %>
        </td>
      <% end %>
    </tr>
  <% end %>
<% end %>

# yields

<table class="table table-striped">
  <thead>
    <tr>
      <th>A</th>
      <th>B</th>
      <th>C</th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <td>
          1
        </td>
        <td>
          2
        </td>
        <td>
          3
        </td>
    </tr>
    <tr>
        <td>
          4
        </td>
        <td>
          5
        </td>
        <td>
          6
        </td>
    </tr>
  </tbody>
</table>
```

* **bootstrap_nav_tabs**
https://getbootstrap.com/docs/4.0/components/navs/
  * **nav_link_class** -> helper method to add "active" class if `current_page?(link_url)` is truthy
  * **nav_tab_link** -> helper method for nav tab link, uses nav link class

```erb
<%= bootstrap_nav_tabs do |tabs| %>
  <% tabs << nav_tab_link('Some Link', 'https://example.com') %>
  <% tabs << nav_tab_link('Active Link', {controller: params[:controller], action: params[:action]}) %>
<% end %>

# yields

<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" href="https://example.com">Some Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="/">Active Link</a>
  </li>
</ul>
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
