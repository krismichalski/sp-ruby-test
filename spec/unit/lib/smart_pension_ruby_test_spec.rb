require "smart_pension_ruby_test"

RSpec.describe SmartPensionRubyTest do
  let(:smart_pension_ruby_test) do
    described_class.new(
      input_path: input_path,
      input_reader: input_reader,
      parser: parser,
      counter: counter,
      sorter: sorter,
      formatter: formatter,
      writer: writer,
    )
  end

  let(:input_path) { "some_file_path" }
  let(:input_reader) { Reader::File }
  let(:parser) { Parser::SimpleLog }
  let(:counter) { Counter::Total }
  let(:sorter) { Sorter::Descending }
  let(:formatter) { Formatter::Total }
  let(:writer) { Writer::StandardOutput }

  let(:log_lines) { instance_double(Array) }
  let(:storage) { instance_double(Hash) }

  shared_examples "correctly calls all services" do
    it "correctly calls all services in order" do
      expect(input_reader).to receive(:call).with(input_path: input_path).once.and_return(log_lines).ordered
      expect(parser).to receive(:call).with(lines: log_lines).once.and_return(storage).ordered
      expect(counter).to receive(:call).with(storage: storage).once.and_return(storage).ordered
      expect(sorter).to receive(:call).with(storage: storage).once.and_return(storage).ordered
      expect(formatter).to receive(:call).with(storage: storage).once.and_return(storage).ordered
      expect(writer).to receive(:call).with(storage: storage).once.ordered

      subject
    end
  end
  
  describe "#call" do
    subject { smart_pension_ruby_test.call }

    context "with correct input path and default services" do
      include_examples "correctly calls all services"
    end

    context "with changed counter service" do
      let(:counter) { Counter::Unique }

      include_examples "correctly calls all services"
    end

    context "with changed formatter service" do
      let(:counter) { Formatter::Unique }

      include_examples "correctly calls all services"
    end

    context "with empty input path" do
      let(:input_path) { nil }
      
      it "raises proper error" do
        expect { subject }.to raise_error("Path to input not provided!")
      end
    end
  end
end
