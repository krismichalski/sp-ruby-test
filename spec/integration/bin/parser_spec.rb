require_relative '../../../bin/parser'

RSpec.describe "bin/parser" do
  subject { run(input_path: input_path, mode: mode) }
  let(:input_path) { "webserver.log" }

  describe "#run" do
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
            /help_page/1 23 unique views
            /contact 23 unique views
            /home 23 unique views
            /index 23 unique views
            /about/2 22 unique views
            /about 21 unique views
          TEXT
        ).to_stdout
      end
    end
  end
end
