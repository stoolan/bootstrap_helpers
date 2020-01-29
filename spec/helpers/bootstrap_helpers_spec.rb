require 'rails_helper'

describe BootstrapHelpers, type: :helper do
  describe 'with no options' do
    subject { helper.bootstrap_text }
    it { should == "<p class=\"text text-primary\"></p>" }
  end
end
