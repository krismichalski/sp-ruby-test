require "file_reader"
require "tempfile"

RSpec.describe FileReader do
  let(:file_reader) { described_class.new(file_path: file_path) }

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

  describe "#call" do
    subject { file_reader.call }

    context "when file can be found" do
      let(:file_path) { tempfile.path }

      it "returns the array containing all lines from file" do
        expect(subject).to eq(lines)
      end
    end

    context "when file can't be found" do
      let(:file_path) { "some/invalid/path" }

      it "raises an error" do
        expect { subject }.to raise_error("Couldn't find file in the given path: some/invalid/path")
      end
    end
  end
end
