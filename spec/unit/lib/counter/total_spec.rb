# frozen_string_literal: true

require "counter/total"

RSpec.describe Counter::Total do
  subject { described_class.call(storage: storage) }

  let(:storage) do
    {
      a: %w[1 2 3],
      b: %w[1 2 3 4],
      c: %w[1],
    }
  end

  describe "#call" do
    it "counts total entries in each key" do
      expect(subject).to eq(
        a: 3,
        b: 4,
        c: 1,
      )
    end
  end
end
