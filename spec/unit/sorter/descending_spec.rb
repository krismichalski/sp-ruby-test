# frozen_string_literal: true

RSpec.describe Sorter::Descending do
  subject { described_class.call(storage: storage) }

  let(:storage) do
    {
      a: 6,
      b: 9,
      c: 1,
    }
  end

  describe "#call" do
    it "sorts storage based on values (descending)" do
      expect(subject).to eq(
        b: 9,
        a: 6,
        c: 1,
      )
    end
  end
end
