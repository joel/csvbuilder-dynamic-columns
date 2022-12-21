require 'spec_helper'

RSpec.describe Csvbuilder::Import do
  def test_attributes
    expect(klass.new(%w[a b]).attributes).to eql(string1: 'a', string2: 'b')
  end

  it_behaves_like "with_or_without_csvbuilder_model", Csvbuilder::Import
end