# frozen_string_literal: true

require "parser"

RSpec.describe Parser do
  subject { described_class.run(input_path: input_path, mode: mode) }

  let(:input_path) { tempfile.path }

  let(:tempfile) do
    Tempfile.new("webserver_log").tap do |file|
      lines.each do |line|
        file << line + "\n"
      end

      file.close
    end
  end

  let(:lines) do
    [
      "/help_page/1 8.8.8.8",
      "/help_page/1 8.8.8.8",
      "/help_page/1 4.4.4.4",
      "/help_page/1 4.4.4.4",
      "/home 8.8.8.8",
      "/home 4.4.4.4",
      "/home 2.2.2.2",
      "/contact 8.8.8.8",
      "/index 2.2.2.2",
    ]
  end

  describe "#run" do
    context "sort by total hits" do
      let(:mode) { :total }

      it "prints out sorted visits" do
        expect { subject }.to output(
          <<~TEXT,
            /help_page/1 4 visits
            /home 3 visits
            /contact 1 visits
            /index 1 visits
          TEXT
        ).to_stdout
      end
    end

    context "sort by unique hits" do
      let(:mode) { :unique }

      it "prints out sorted visits" do
        expect { subject }.to output(
          <<~TEXT,
            /home 3 unique views
            /help_page/1 2 unique views
            /contact 1 unique views
            /index 1 unique views
          TEXT
        ).to_stdout
      end
    end
  end
end
