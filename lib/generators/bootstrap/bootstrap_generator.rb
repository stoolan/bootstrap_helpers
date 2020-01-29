class BootstrapGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  def add_bootstrap_gem
    gem "bootstrap", version: "~>4.3.1"
  end

  def add_scss_import
    if File.exist?("#{Rails.root}/app/assets/stylesheets/application.css")
      remove_file "#{Rails.root}/app/assets/stylesheets/application.css"
      create_file "#{Rails.root}/app/assets/stylesheets/application.scss"
    end
    inject_into_file "#{Rails.root}/app/assets/stylesheets/application.scss" do
      '@import "bootstrap";'
    end
  end

  def update_webpack
    [
      ["jquery", "^3.4.1"],
      ["bootstrap", "4.3.1"],
      ["popper.js", "^1.16.0"]
    ].each do |lib, version|
      inject_into_file "#{Rails.root}/package.json", after: '"dependencies": {' do
        "\n    \"#{lib}\": \"#{version}\","
      end
    end
    rake "yarn:install"
  end

  def add_js_pack
    inject_into_file "#{Rails.root}/app/javascript/packs/application.js" do
      "require('bootstrap')"
    end
  end

  def update_environment_js
    inject_into_file "#{Rails.root}/config/webpack/environment.js", after: "require('@rails/webpacker')\n" do
      <<-EOH
// https://stackoverflow.com/questions/54905026/how-to-add-jquery-third-party-plugin-in-rails-6-webpacker
environment.loaders.append('jquery', {
  test: require.resolve('jquery'),
  use: [{
    loader: 'expose-loader',
    options: '$',
  }, {
    loader: 'expose-loader',
    options: 'jQuery',
  }],
});
      EOH
    end
  end
end
