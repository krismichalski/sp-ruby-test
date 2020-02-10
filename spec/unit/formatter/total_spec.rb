# frozen_string_literal: true

RSpec.describe Formatter::Total do
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
          "/path/2 9 visits",
          "/path/1 6 visits",
          "/path/3 1 visits",
        ],
      )
    end
  end
end
