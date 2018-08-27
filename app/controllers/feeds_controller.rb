class FeedsController < ApplicationController
  before_action :set_feed, only: [:edit, :update, :destroy]

  def index
    @feeds = Feed.all.order('created_at desc')
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)
  end

  def edit
  end

  def update
    @update = @feed.update_attributes(feed_params)
  end

  def destroy
    @feed.destroy
  end

  private

  def feed_params
    params.require(:feed).permit(:url)
  end

  def set_feed
    @feed = Feed.find params[:id]
  end
end
