#!/usr/bin/env ruby
require 'html2rss'

rss =
  Html2rss.feed(
    channel: { url: 'https://clickhouse.com/blog', title: 'ClickHouse Blog', description: 'Learn about the latest ClickHouse tips, tricks and company announcements.' },
    selectors: {
      items: { selector: 'a.post' },
      title: { selector: '.title' },
      description: { selector: '.description', post_process: { name: 'sanitize_html' } },
      link: { selector: '@href' },
      #link: { selector: '@href', extractor: 'href' },
      author: { selector: '.name' },
      updated: { selector: '.date', post_process: { name: 'parse_time', time_zone: 'UTC' } },
      category: { selector: '.category' },
      categories: %i[category]
    }
  )

puts rss
