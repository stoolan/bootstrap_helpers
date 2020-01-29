class FontawesomeGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)
  def add_gem
    gem "font-awesome-rails"
  end
  def add_scss_import
    if File.exist?("#{Rails.root}/app/assets/stylesheets/application.css")
      remove_file "#{Rails.root}/app/assets/stylesheets/application.css"
      create_file "#{Rails.root}/app/assets/stylesheets/application.scss"
    end
    inject_into_file "#{Rails.root}/app/assets/stylesheets/application.scss" do
      '@import "font-awesome";'
    end
  end
  def update_webpack
    [
      ["@fortawesome/fontawesome-free", "^5.12.0"],
    ].each do |lib, version|
      inject_into_file "#{Rails.root}/package.json", after: '"dependencies": {' do
        "\n    \"#{lib}\": \"#{version}\","
      end
    end
    rake "yarn:install"
  end
end
