require "formatter/base"

RSpec.describe Formatter::Base do
  let(:base_formatter) { described_class.new(path: path, number_of_visits: number_of_visits) }

  let(:path) { "/path/1" }
  let(:number_of_visits) { 44 }

  describe "#format" do
    subject { base_formatter.format }

    it "raises NotImplementedError" do
      expect { subject }.to raise_error(NotImplementedError)
    end
  end
end
