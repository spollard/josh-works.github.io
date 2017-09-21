#!/usr/bin/env ruby

require 'html2markdown'

POST_REGEX = %r{(?<year>[0-9]+)-(?<month>[0-9]+)-(?<day>[0-9]+)-(?<title>.*).html}

files = Dir.glob('./_posts/*.html').select{ |f| f.match POST_REGEX }

files.each do |post|
  data = post.match(POST_REGEX)
  p = HTMLPage.new(contents: File.read(post))
  File.open(post, 'w') { |f| f.puts p.markdown }
  if /^\d{4}-\d{2}-\d{2}/.match(data[:title])
    formatted = data[:title].slice(11..(data[:title].length))
    File.rename(post, "./_posts/#{data[:year]}-#{data[:month]}-#{data[:day]}-#{formatted}.md")
  else
    File.rename(post, "./_posts/#{data[:year]}-#{data[:month]}-#{data[:day]}-#{data[:title]}.md")
  end
end
