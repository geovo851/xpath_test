require 'xpath'
require 'rexml/document'

f = File.open("../xml/test_1.xml")
xmldoc = REXML::Document.new(f)

i = 0
els = []
REXML::XPath.each(xmldoc, 'ul/ded//ul[@id="foo"]') do |el|
  els << el
  i += 1
  puts i
  puts el
end

puts '--------------------------------------------'

els.each do |el|
  el.each_element do |e|
    puts e
  end
end
