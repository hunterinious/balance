# require 'xml_parser'
# require 'balance'
# require 'net/http'
# require 'rexml/document'
#
# describe 'Balance' do
#   describe '#initialize' do
#     context 'when correct initialize' do
#       it 'set instance variables corect' do
#         parser = XmlParser.read_from_xml("http://www.cbr.ru/scripts/XML_daily.asp")
#         currency_nodes = parser.nodes
#         balance = Balance.new(currency_nodes)
#         expect(balance.ruble).to eq 0
#         expect(balance.currency).to eq 0
#         expect(balance.transfer).to eq 0
#         expect(balance.currencies.size).to eq 34
#       end
#     end
#   end
# end
