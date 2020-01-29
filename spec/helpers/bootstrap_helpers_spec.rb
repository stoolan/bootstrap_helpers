require 'rails_helper'

describe BootstrapHelpers, type: :helper do
  describe 'text with no options' do
    subject { helper.bootstrap_text }
    it { should == "<p class=\"text text-primary\"></p>" }
  end
  describe 'text with class options' do
    subject { helper.bootstrap_text(class: "danger") }
    it { should == "<p class=\"text text-danger\"></p>" }
  end
  describe 'text with class and text options' do
    subject { helper.bootstrap_text(class: "danger", text: "Foo!") }
    it { should == "<p class=\"text text-danger\">Foo!</p>" }
  end

  describe 'card with no options' do
    subject { helper.bootstrap_card(title: "A Title") }
    it { should == "<div class=\"card\"><div class=\"card-body\"><h3 class=\"card-title\">A Title</h3><h4 class=\"card-subtitle mb-2 text-muted\"></h4><div class=\"card-text\"></div></div></div>" }
  end
  describe 'card with block' do
    subject { helper.bootstrap_card(title: "A Title") do
      "Foo!"
    end
    }
    it { should == "<div class=\"card\"><div class=\"card-body\"><h3 class=\"card-title\">A Title</h3><h4 class=\"card-subtitle mb-2 text-muted\"></h4><div class=\"card-text\">Foo!</div></div></div>"}
  end

  describe 'alert with no options' do
    subject { helper.bootstrap_alert }
    it { should == "<div class=\"alert alert-primary\" role=\"alert\"></div>" }
  end
  describe 'alert with no text & class options' do
    subject { helper.bootstrap_alert(text: "FooBar", class: "success") }
    it { should == "<div class=\"alert alert-success\" role=\"alert\">FooBar</div>" }
  end
  describe 'alert with block' do
    subject { helper.bootstrap_alert(class: "success") do
      content_tag(:div, class: "peon") do
        concat("Foo!")
      end
    end}
    it { should == "<div class=\"alert alert-success\" role=\"alert\"><div class=\"peon\">Foo!</div></div>" }
  end
end
