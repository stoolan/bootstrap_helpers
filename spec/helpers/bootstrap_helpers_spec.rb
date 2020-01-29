require "rails_helper"

describe BootstrapHelpers, type: :helper do
  describe "text with no options" do
    subject { helper.bootstrap_text }
    it { should == "<p class=\"text text-primary\"></p>" }
  end
  describe "text with class options" do
    subject { helper.bootstrap_text(class: "danger") }
    it { should == "<p class=\"text text-danger\"></p>" }
  end
  describe "text with class and text options" do
    subject { helper.bootstrap_text(class: "danger", text: "Foo!") }
    it { should == "<p class=\"text text-danger\">Foo!</p>" }
  end

  describe "card with no options" do
    subject { helper.bootstrap_card(title: "A Title") }
    it { should == "<div class=\"card\"><div class=\"card-body\"><h3 class=\"card-title\">A Title</h3><h4 class=\"card-subtitle mb-2 text-muted\"></h4><div class=\"card-text\"></div></div></div>" }
  end
  describe "card with block" do
    subject { helper.bootstrap_card(title: "A Title") do
      "Foo!"
    end
    }
    it { should == "<div class=\"card\"><div class=\"card-body\"><h3 class=\"card-title\">A Title</h3><h4 class=\"card-subtitle mb-2 text-muted\"></h4><div class=\"card-text\">Foo!</div></div></div>" }
  end

  describe "alert with no options" do
    subject { helper.bootstrap_alert }
    it { should == "<div class=\"alert alert-primary\" role=\"alert\"></div>" }
  end
  describe "alert with no text & class options" do
    subject { helper.bootstrap_alert(text: "FooBar", class: "success") }
    it { should == "<div class=\"alert alert-success\" role=\"alert\">FooBar</div>" }
  end
  describe "alert with block" do
    subject { helper.bootstrap_alert(class: "success") do
      content_tag(:div, class: "peon") do
        concat("Foo!")
      end
    end}
    it { should == "<div class=\"alert alert-success\" role=\"alert\"><div class=\"peon\">Foo!</div></div>" }
  end

  describe "table with no options" do
    subject { helper.bootstrap_table }
    it { should == "<table class=\"table table-striped\"><thead><tr></tr></thead><tbody></tbody></table>" }
  end
  describe "table with class options" do
    subject { helper.bootstrap_table(class: "table table-striped table-bordered") }
    it { should == "<table class=\"table table-striped table-bordered\"><thead><tr></tr></thead><tbody></tbody></table>" }
  end
  describe "table with row options" do
    subject { helper.bootstrap_table(rows: [[0, 1, 2], [3, 4, 5]]) }
    it { should == "<table class=\"table table-striped\"><thead><tr></tr></thead><tbody><tr><td>0</td><td>1</td><td>2</td></tr><tr><td>3</td><td>4</td><td>5</td></tr></tbody></table>" }
  end
  describe "table with row/header options" do
    subject { helper.bootstrap_table(headers: ["A", "B", "C"], rows: [[0, 1, 2], [3, 4, 5]]) }
    it { should == "<table class=\"table table-striped\"><thead><tr><th>A</th><th>B</th><th>C</th></tr></thead><tbody><tr><td>0</td><td>1</td><td>2</td></tr><tr><td>3</td><td>4</td><td>5</td></tr></tbody></table>" }
  end

  describe "nav tabs" do
    def current_page?(x)
      true
    end
    subject { helper.bootstrap_nav_tabs do |tabs|
      tabs << nav_tab_link("Something", "a_url")
      tabs << nav_tab_link("Something Else", "a_url2")
    end}
    it { should == "<ul class=\"nav nav-tabs\"><li class=\"nav-item\"><a class=\"nav-link active\" href=\"a_url\">Something</a></li><li class=\"nav-item\"><a class=\"nav-link active\" href=\"a_url2\">Something Else</a></li></ul>" }
  end
end
