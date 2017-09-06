require 'ethernet_worker'
require 'net/http'

describe 'EthernetWorker' do
  describe '.read_by_url' do
    context 'when no ethernet connection,wrong url or something other problems like HTTPNotFound' do
      it 'raise exception' do
        expect { EthernetWorker.read_by_url("Какой-то адрес") }.to raise_exception(StandardError)
      end
    end

    context 'when url correct,ethernet connection stable and no other problems like  HTTPBadGateway' do
      it 'return new instance of EthernetWorker' do
        worker = EthernetWorker.read_by_url("http://www.cbr.ru/scripts/XML_daily.asp")
        expect(worker.body).not_to eq nil
        expect(worker.code).to eq "200"
        expect(worker.name).to eq "Net::HTTPOK"
      end
    end
  end
end
