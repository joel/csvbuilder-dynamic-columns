require 'spec_helper'

RSpec.describe Csvbuilder::Export do
  def test_attributes
    attributes = { string1: 'a', string2: 'b' }
    expect(klass.new(OpenStruct.new(attributes)).attributes).to eql attributes
  end

  it_behaves_like "with_or_without_csvbuilder_model", Csvbuilder::Export
end