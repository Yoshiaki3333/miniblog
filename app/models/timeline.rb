class Timeline < ApplicationRecord
    belongs_to :timelineable, polymorphic: true
end
