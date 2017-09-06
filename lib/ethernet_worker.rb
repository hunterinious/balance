require 'net/http'

class EthernetWorker
  attr_reader :response
  def initialize(params)
    @response = params[:response]
  end

  def self.read_by_url(url)
    begin
      response = Net::HTTP.get_response(URI.parse(url))
      code = response.code
    rescue StandardError => e
      if response.nil?
        raise "Возможно ошибка в написании адреса веб страницы или нет подключения к интернету\n(#{e.message}"
      elsif code == 408
        raise "Слишком долго ожидал запроса, не удалось\n(#{e.message}"
      elsif code == 502
        raise "Проверьте имеется ли вообще доступ к ресурсам сети Интренет. Для этого в браузере наберите" +
              "адрес любого другого сайта, желательно гарантированно работающего.\n(#{e.message}"
      elsif code == 503
        raise " сервер временно не имеет возможности обрабатывать запросы по техническим причинам" +
              "(обслуживание, перегрузка и прочее).\n(#{e.message}"
      else
        raise "Что то пошло не так(#{e.message} "
      end
    end
    new(
        response: response
    )
  end

  def body
    @response.body
  end

  def code
    @response.code
  end

  def name
    @response.class.name
  end
end