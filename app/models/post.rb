class Post < ApplicationRecord
  belongs_to :feed

  validates_presence_of :title, :url, :publish_date

end
