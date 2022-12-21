require 'spec_helper'

RSpec.describe Csvbuilder::Import do
    let(:klass) do
     Class.new do
      include Csvbuilder::Import
    end
  end

  it do
    expect(klass.included_modules).to include(Csvbuilder::Model::DynamicColumns)
  end
end