# frozen_string_literal: true

require "formatter/base"

RSpec.describe Formatter::Base do
  subject { described_class.call(storage: storage) }

  let(:storage) do
    {
      "/path/2" => 9,
      "/path/1" => 6,
      "/path/3" => 1,
    }
  end

  describe "#call" do
    it "raises NotImplementedError" do
      expect { subject }.to raise_error(NotImplementedError)
    end
  end
end
