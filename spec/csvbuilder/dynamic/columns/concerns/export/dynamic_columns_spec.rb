# frozen_string_literal: true

require "spec_helper"

RSpec.describe Csvbuilder::Export::DynamicColumns do
  let(:skills) { Skill.all }
  let(:instance) { row_model_class.new(User.new("Mario", "Doe"), skills: skills) }
  let(:row_model_class) do
    Class.new do
      include Csvbuilder::Model
      include Csvbuilder::Export
      dynamic_column :skills
    end
  end

  describe "instance" do
    shared_context "standard columns defined" do
      let(:row_model_class) { DynamicColumnExportModel }
    end

    describe "#to_row" do
      subject { instance.to_row }

      it "returns a row representation of the row_model" do
        expect(subject).to eql skills
      end

      with_context "standard columns defined" do
        it "returns a row representation of the row_model" do
          expect(subject).to eql %w[Mario Doe] + skills
        end
      end
    end
  end

  describe "class" do
    describe "::dynamic_column" do
      it_behaves_like "dynamic_column_method", Csvbuilder::Export, Skill.all
    end

    describe "::define_dynamic_attribute_method" do
      subject { row_model_class.send(:define_dynamic_attribute_method, :skills) }

      it "makes an attribute that calls :original_attribute" do
        subject
        expect(instance).to receive(:original_attribute).with(:skills).and_return("tested")
        expect(instance.skills).to eql "tested"
      end
    end
  end
end
