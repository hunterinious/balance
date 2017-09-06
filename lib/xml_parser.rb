require 'rexml/document'

class XmlParser
  attr_reader :nodes

  def initialize(params)
    @nodes = params[:nodes]
  end

  def self.read_from_xml(response)
    begin
    doc = REXML::Document.new(response)
    rescue StandardError => e
      puts "XML не валидный"
      puts "#{e.message}"
    end
    new(
      nodes: doc.root.elements.to_a
    )
  end
end
