require 'parser'

RSpec.describe Parser do
  let(:parser) { described_class.new(file_path: file_path) }
  let(:file_path) { "webserver.log" }

  describe "#call" do
    subject { parser.call }

    it "prints out sorted visits" do
      expect { subject }.to output(
        <<~TEXT
          "================ SORTED =================="
          "/about/2 90 visits"
          "/contact 89 visits"
          "/index 82 visits"
          "/about 81 visits"
          "/help_page/1 80 visits"
          "/home 78 visits"
          "================ UNIQUE =================="
          "/help_page/1 23 unique visits"
          "/contact 23 unique visits"
          "/home 23 unique visits"
          "/index 23 unique visits"
          "/about/2 22 unique visits"
          "/about 21 unique visits"
        TEXT
      ).to_stdout
    end
  end
end
