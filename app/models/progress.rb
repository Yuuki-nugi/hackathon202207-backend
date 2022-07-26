class Progress < ApplicationRecord
    belongs_to :work
    belongs_to :theme, optional: true
    
    after_commit do
        ActionCable.server.broadcast("works_#{self.work_id}", progress: self)
    end
end
