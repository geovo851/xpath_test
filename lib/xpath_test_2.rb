require 'xpath'
require 'rexml/document'

f = File.open("../xml/test_2.xml")
xmldoc = REXML::Document.new(f)

# nodename
REXML::XPath.each(xmldoc, 'bookstore/*') do |el|
  puts el
  puts "Element: #{el.name}, title: #{el.text('title')}"
  puts "--------------------------------------------\n\n"
end

puts "=============================================\nExample /"
# /
REXML::XPath.each(xmldoc, '/bookstore') do |el|
  puts el
  puts "Element: #{el.name}, title: #{el.text('title')}"
  puts "--------------------------------------------\n\n"
end

puts "=============================================\nExample //"
# //
REXML::XPath.each(xmldoc, '//book') do |el|
  puts el
  puts "Element: #{el.name}, title: #{el.text('title')}"
  puts "--------------------------------------------\n\n"
end

puts "=============================================\nExample @"
# @
REXML::XPath.each(xmldoc, "//title[@lang]") do |el|
  puts el
  puts "Element: #{el.name}, text: #{el.text()}"
  puts "--------------------------------------------\n\n"
end

puts "=============================================\nExample @"
# @
REXML::XPath.each(xmldoc, "//title[@lang='ru']") do |el|
  puts el
  puts "Element: #{el.name}, text: #{el.text()}"
  puts "--------------------------------------------\n\n"
end

puts "=============================================\nExample []"
# []
REXML::XPath.each(xmldoc, "/bookstore/book[2]") do |el|
  puts el
  puts "Element: #{el.name}, title: #{el.text('title')}"
  puts "--------------------------------------------\n\n"
end

puts "=============================================\nExample last()"
# last
REXML::XPath.each(xmldoc, "/bookstore/book[last()]") do |el|
  puts el
  puts "Element: #{el.name}, title: #{el.text('title')}"
  puts "--------------------------------------------\n\n"
end

puts "=============================================\nExample >"
# >
REXML::XPath.each(xmldoc, "/bookstore/book[price>35.00]") do |el|
  puts el
  puts "Element: #{el.name}, title: #{el.text('title')}"
  puts "--------------------------------------------\n\n"
end


puts "=============================================\nExample Axes child"
# Axes child
REXML::XPath.each(xmldoc, "/bookstore/child::book") do |el|
  puts el
  puts "Element: #{el.name}, title: #{el.text('title')}"
  puts "--------------------------------------------\n\n"
end

puts "=============================================\nExample Axes descendant"
# Axes descendant
REXML::XPath.each(xmldoc, "/bookstore/descendant::book") do |el|
  puts el
  puts "Element: #{el.name}, title: #{el.text('title')}"
  puts "--------------------------------------------\n\n"
end

puts "=============================================\nExample Axes child::*/child::price"
# Axes child::*/child::price
REXML::XPath.each(xmldoc, "/bookstore/child::*/child::price") do |el|
  puts el
  puts "Element: #{el.name}, price: #{el.text()}"
  puts "--------------------------------------------\n\n"
end