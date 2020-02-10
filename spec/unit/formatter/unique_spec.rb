# frozen_string_literal: true

require "formatter/unique"

RSpec.describe Formatter::Unique do
  subject { described_class.call(storage: storage) }

  let(:storage) do
    {
      "/path/2" => 9,
      "/path/1" => 6,
      "/path/3" => 1,
    }
  end

  describe "#call" do
    it "correctly formats the storage" do
      expect(subject).to eq(
        [
          "/path/2 9 unique views",
          "/path/1 6 unique views",
          "/path/3 1 unique views",
        ],
      )
    end
  end
end
