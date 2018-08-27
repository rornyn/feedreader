class Feed < ApplicationRecord

   validates :url, presence: true, uniqueness: true, format: URI::regexp(%w(http https))

   before_save :fetch_title, if: -> { url_changed? }

  private

  def fetch_title

  end
end
