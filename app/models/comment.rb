class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :tweet, ->{ order("updated_at DESC") }
    has_one :timeline, as: :timelineable, dependent: :destroy
    
    #callback
    after_create :create_timeline
    
    #validation
    validates_presence_of :user_id, :text
    
    private
    def  create_timeline
        self.timeline = Timeline.create(updated_at: updated_at)
    end

end
