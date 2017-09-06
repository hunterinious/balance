require_relative 'lib/xml_parser'
require_relative 'lib/currency_info'
require_relative 'lib/balance'
require_relative 'lib/ethernet_worker'

url = "http://www.cbr.ru/scripts/XML_daily.asp"

ethernet_worker = EthernetWorker.read_by_url(url)

parser = XmlParser.read_from_xml(ethernet_worker.body)
currency_nodes = parser.nodes

balance = Balance.new(currency_nodes)
puts "Какая валюта у вас в портфеле?"
balance.currencies.each_with_index do |currency,index|
  puts "#{index + 1}. #{currency.name}"
end

balance.choice
puts "Сколько у вас рублей?"
balance.how_many_rubles
puts "Сколько у вас валюты?"
balance.how_many_currency

puts "Сейчас курс #{balance.currency_name}: #{balance.rate} руб"

puts balance.balance_please
