require 'open-uri'
class RssParseService

  def initialize(feed)
    @feed = feed
  end

  def call
    parsing_feed_url
  end

  private
  attr_reader :feed

  def parsing_feed_url
    fetch_feed_title
    fetch_reader_detail_from_rss_url
  rescue StandardError => e
    RSSLogger.error("***DATA SAVING OR PARSING POST ERROR***")
    RSSLogger.info(e.message)
    puts "===================="
  end

  def fetch_feed_title
    title = parse_document.at('title')&.text
    feed.update_attribute('title', title) if title
  end

  def fetch_reader_detail_from_rss_url
    blogs = parse_document.css('item')
    blogs.each do |blog|
      feed.posts.create!(post_attribute(blog))
    end
  end

  def post_attribute(blog_data)
    {
      title: blog_data.at("title")&.text,
      url: blog_data.at("link")&.text,
      publish_date: blog_data.at("pubDate")&.text
    }
  end

  def parse_document
    Nokogiri::XML(open(feed.url))
  rescue Errno::ENOENT, Nokogiri::XML::SyntaxError => e
    RSSLogger.error("***PARSING ERROR***")
    RSSLogger.error(e.message)
    puts "===================="
  end
end
