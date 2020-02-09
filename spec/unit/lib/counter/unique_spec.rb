require "counter/unique"

RSpec.describe Counter::Unique do
  let(:unique_counter) { described_class.new(ips_array: ips_array) }

  let(:ips_array) do
    %w(8.8.8.8 8.8.8.8 4.4.4.4 2.2.2.2 2.2.2.2)
  end

  describe "#count" do
    subject { unique_counter.count }

    it { is_expected.to eq(3) }
  end
end
