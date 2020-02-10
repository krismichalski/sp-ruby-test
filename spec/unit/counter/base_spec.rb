# frozen_string_literal: true

RSpec.describe Counter::Base do
  subject { described_class.call(storage: storage) }

  let(:storage) do
    {
      a: %w[1 2 3],
      b: %w[1 2 3 4],
      c: %w[1],
    }
  end

  describe "#call" do
    it "raises NotImplementedError" do
      expect { subject }.to raise_error(NotImplementedError)
    end
  end
end
