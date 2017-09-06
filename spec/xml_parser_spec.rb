require 'xml_parser'
require 'ethernet_worker'
require 'rexml/document'

describe 'XmlParser' do
  describe '.read_from_xml' do
    let(:path) { File.join(File.dirname(__FILE__), '/fixtures') }

    context 'when put to it valid xml file' do
      it 'should return nodes and size ot them should be 34' do
        EthernetWorker = double("EthernetWorker")
        correct_file = File.new(path + "/correct.xml")
        allow(double).to receive("read_by_url").and_return(correct_file)
        parser = XmlParser.read_from_xml(correct_file)
        expect(parser.nodes.size).to eq 34
      end
    end

    context 'when put to it invalid xml file' do
      it 'should raise error when xml invalid' do
        EthernetWorker = double("EthernetWorker")
        wrong_file = File.new(path + "/wrong.xml")
        allow(double).to receive(:read_by_url).and_return(wrong_file)
        expect { XmlParser.read_from_xml(wrong_file) }.to raise_exception(StandardError)
      end
    end
  end
end
