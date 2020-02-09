require "counter/total"

RSpec.describe Counter::Total do
  let(:total_counter) { described_class.new(ips_array: ips_array) }

  let(:ips_array) do
    %w(8.8.8.8 8.8.8.8 4.4.4.4 2.2.2.2 2.2.2.2)
  end

  describe "#count" do
    subject { total_counter.count }

    it { is_expected.to eq(5) }
  end
end
