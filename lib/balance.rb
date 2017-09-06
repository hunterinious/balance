require_relative 'currency_info'

class Balance
  attr_reader :currencies, :ruble, :currency, :transfer

  def initialize(currency_nodes)
    @currencies = []
    currency_nodes.each do |node|
      @currencies << CurrencyInfo.read_from_xml(node)
    end
    @ruble = 0
    @currency = 0
    @transfer = 0
  end

  def choice
    currency_index = -1
    while !currency_index.between?(1, currencies.size) do
      puts "Введите число от 1 до #{currencies.size}"
      currency_index = gets.to_i
    end
    @choice = currency_index
  end

  def how_many_rubles
    @ruble = gets.encode("UTF-8").to_f
  end

  def how_many_currency
    @currency = gets.encode("UTF-8").to_f
  end

  def rate
    @currencies[@choice - 1].value
  end

  def currency_name
    @currencies[@choice - 1].name
  end

  def transfer_please
    @transfer = @currency * rate
  end

  def balanced?
    (@transfer - @ruble).abs < 0.01
  end

  def transfer_currency?
    @transfer > @ruble
  end

  def balance_please
    transfer_please
    if balanced?
      "Портфель уже сбалансирован"
    elsif transfer_currency?
      rest = (((@transfer - @ruble)/2)/rate).round(2.0)
      "Нужно обменять #{currency_name}: #{rest}"
    else
      rest = ((@ruble - @transfer)/2).round(2.0)
      "Нужно обменять рублей:#{rest} руб"
    end
  end
end
