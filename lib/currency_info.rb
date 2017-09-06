class CurrencyInfo
  attr_reader :value, :name

  def initialize(params)
    @value = params[:value]
    @name = params[:name]
  end

  def self.read_from_xml(node)
    new(
      value: node.elements['Value'].text.to_f,
      name: node.elements['Name'].text
    )
  end

  def to_s
    "#{@name}: #{@value} руб."
  end
end
