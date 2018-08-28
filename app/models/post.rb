class Post < ApplicationRecord
  belongs_to :feed

  validates_presence_of :title, :url, :publish_date

  delegate :title, to: :feed, allow_nil: true, prefix: true

  def publish_date
    super&.strftime("%A, %d %b %Y %l:%M %p")
  end

end
