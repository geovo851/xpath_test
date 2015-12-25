require 'rexml/document'

f = File.open("../xml/test.xml")
xmldoc = REXML::Document.new(f)

# Info for the first movie found
movie = REXML::XPath.first(xmldoc, "//movie")
p movie

# Print out all the movie types
REXML::XPath.each(xmldoc, "//type") { |e| puts e.text }

# Get an array of all of the movie formats.
names = REXML::XPath.match(xmldoc, "//format").map {|x| x.text }
p names
