class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :work

    after_commit do
        ActionCable.server.broadcast("works_#{self.work_id}", comments: self)
    end
end
