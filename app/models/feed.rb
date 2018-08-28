class Feed < ApplicationRecord

  #Association
  has_many :posts, dependent: :destroy

  validates :url, presence: true, uniqueness: true, format: URI::regexp(%w(http https))

  after_save :fetch_latest_posts , if: -> { saved_change_to_url? }

  def url=(val)
    super(val.strip) if val
  end
  private

  def fetch_latest_posts
    #FOR BACKGRUND JOB: need to configure sidekiq setup or any bg job manager
    ParsingFeedJob.perform_now(self)
  end
end
