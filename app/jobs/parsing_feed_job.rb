class ParsingFeedJob < ApplicationJob
   queue_as :default

  def perform(feed)
    RssParseService.new(feed).call
  end
end
