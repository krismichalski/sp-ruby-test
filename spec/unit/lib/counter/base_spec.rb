require "counter/base"

RSpec.describe Counter::Base do
  let(:counter_base) { described_class.new(ips_array: ips_array) }

  let(:ips_array) do
    %w(8.8.8.8 8.8.8.8 4.4.4.4 2.2.2.2 2.2.2.2)
  end

  describe "#count" do
    subject { counter_base.count }

    it "raises NotImplementedError" do
      expect { subject }.to raise_error(NotImplementedError)
    end
  end
end
