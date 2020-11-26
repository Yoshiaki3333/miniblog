class Tweet < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_one :timeline, as: :timelineable, dependent: :destroy
    
    #callback
    after_create :create_timeline
    
    private
    def  create_timeline
        self.timeline = Timeline.create(updated_at: updated_at)
    end
end
