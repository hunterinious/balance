# require 'currency_info'
# require 'xml_parser'
# require 'net/http'
# require 'rexml/document'
#
# describe 'CurrencyInfo' do
#   describe '#initialize' do
#     context 'when correct initialize' do
#       it 'set instance variables corect' do
#         parser = XmlParser.read_from_xml("http://www.cbr.ru/scripts/XML_daily.asp")
#         currency_nodes = parser.nodes
#         info = CurrencyInfo.read_from_xml(currency_nodes[0])
#         expect(info.name).to eq "Австралийский доллар"
#         expect(info.value). to eq 47
#       end
#     end
#   end
# end

