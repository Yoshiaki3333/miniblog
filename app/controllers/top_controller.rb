class TopController < ApplicationController
  def index
    timeline = Timeline.order('created_at DESC')
    @timelines = timeline.map(&:timelineable)
  end
end