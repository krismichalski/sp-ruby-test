require 'parser'

RSpec.describe Parser do
  let(:parser) { described_class.new(file_path: file_path, mode: mode) }
  let(:file_path) { "webserver.log" }

  describe "#call" do
    subject { parser.call }

    context "sort by total hits" do
      let(:mode) { :total }

      it "prints out sorted visits" do
        expect { subject }.to output(
          <<~TEXT
            /about/2 90 visits
            /contact 89 visits
            /index 82 visits
            /about 81 visits
            /help_page/1 80 visits
            /home 78 visits
          TEXT
        ).to_stdout
      end
    end

    context "sort by unique hits" do
      let(:mode) { :unique }

      it "prints out sorted visits" do
        expect { subject }.to output(
          <<~TEXT
            /help_page/1 23 visits
            /contact 23 visits
            /home 23 visits
            /index 23 visits
            /about/2 22 visits
            /about 21 visits
          TEXT
        ).to_stdout
      end
    end

  end
end
